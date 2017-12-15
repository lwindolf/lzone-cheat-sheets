## SPL Syntax

### Basic Searching Concepts

Simple searches look like the following examples. Note that there are literals with 
and without quoting and that there are data field as well as date source selections 
done with an "=":

|                              |                                               |
|----------------------------- | --------------------------------------------- |
| **Full Text Search**         | 
| `Exception`                  | Find the word 'Exception'
| `One Two Three`              | Find those three words **in any order**
| `"One Two Three"`            | Find the exact phrase
| **Filter by fields**         |
| `source="/var/log/apache/access.log" status=500` | All lines where the field "status" has value 500 from the file /var/log/apache/access.log 
| **Filter by host**           |  
| `host="myblog" source="/var/log/syslog" Fatal` | Give me all fatal errors from syslog of the blog host
| **Selecting an index**       |
| `index="secretStuff" password` | Access a specific index and text matching 'password'

### Basic Filtering

Two important filters are "rex" and "regex". "rex" is for extraction a
pattern and storing it as a new field. This is why you need to specifiy
a named extraction group in Perl like manner "(?...)" for example

    source="some.log" Fatal | rex "(?i) msg=(?P[^,]+)"

When running above query check the list of "interesting fields" it now
should have an entry "FIELDNAME" listing you the top 10 fatal messages
from "some.log" What is the difference to "regex" now? Well "regex" is
like grep. Actually you can rephrase

    source="some.log" Fatal

to

    source="some.log" | regex _raw=".*Fatal.*"

and get the same result. The syntax of "regex" is simply "=". Using it
makes sense once you want to filter for a specific field.

### Calculations

Sum up a field and do some arithmetics:

    ... | stats sum(<field>) as result | eval result=(result/1000)

Determine the size of log events by checking len() of \_raw. The p10()
and p90() functions are returning the 10 and 90 percentiles:

    | eval raw_len=len(_raw) | stats avg(raw_len), p10(raw_len), p90(raw_len) by sourcetype

### Simple Useful Examples

Splunk usually auto-detects access.log fields so you can do queries
like:

    source="/var/log/nginx/access.log" HTTP 500
    source="/var/log/nginx/access.log" HTTP (200 or 30*)
    source="/var/log/nginx/access.log" status=404 | sort - uri 
    source="/var/log/nginx/access.log" | head 1000 | top 50 clientip
    source="/var/log/nginx/access.log" | head 1000 | top 50 referer
    source="/var/log/nginx/access.log" | head 1000 | top 50 uri
    source="/var/log/nginx/access.log" | head 1000 | top 50 method
    ...

### Emailing Results

By appending "sendemail" to any query you get the result by mail!

    ... | sendemail to="john@example.com"

### Timecharts

Create a timechart from a single field that should be summed up

    ... | table _time, <field> | timechart span=1d sum(<field>)
    ... | table _time, <field>, name | timechart span=1d sum(<field>) by name

## Index Statistics

List All Indices

     | eventcount summarize=false index=* | dedup index | fields index
     | eventcount summarize=false report_size=true index=* | eval size_MB = round(size_bytes/1024/1024,2)
     | REST /services/data/indexes | table title
     | REST /services/data/indexes | table title splunk_server currentDBSizeMB frozenTimePeriodInSecs maxTime minTime totalEventCount

on the command line you can call

    $SPLUNK_HOME/bin/splunk list index

To query write amount of per index the metrics.log can be used:

    index=_internal source=*metrics.log group=per_index_thruput series=* | eval MB = round(kb/1024,2) | timechart sum(MB) as MB by series

MB per day per indexer / index

    index=_internal metrics kb series!=_* "group=per_host_thruput" monthsago=1 | eval indexed_mb = kb / 1024 | timechart fixedrange=t span=1d sum(indexed_mb) by series | rename sum(indexed_mb) as totalmb

    index=_internal metrics kb series!=_* "group=per_index_thruput" monthsago=1 | eval indexed_mb = kb / 1024 | timechart fixedrange=t span=1d sum(indexed_mb) by series | rename sum(indexed_mb) as totalmb

## Reload apps

Load base URL with appended

    /debug/refresh

* * * * *

* * * * *

## Debug Traces

You can enable traces per trace topic listed in splunkd.log. To change
permanently edit /opt/splunk/etc/log.cfg and change the trace level from
"INFO" to "DEBUG". Example:

    category.TcpInputProc=DEBUG

The same can be achieved non-persistent and on-the-fly in the "System
Settings" GUI.

## Configuration

To list effective configuration

    $SPLUNK_HOME/bin/splunk btool inputs list

To check configuration syntax

    $SPLUNK_HOME/bin/splunk btool check

### Inputs

    splunk _internal call /data/inputs/tcp/raw
    splunk _internal call /data/inputs/tcp/raw -get:search sourcetype=foo
    splunk _internal call /servicesNS/nobody/search/data/inputs/tcp/raw/7092 -post:sourcetype bar -post:index bardata

### Licenses

    splunk list licenses

### User Management

To reload authentication config from command line:

    # At least for Splunk 6.x
    splunk _internal call /authentication/providers/services/_reload -auth admin:changeme

    # Older variant
    splunk _internal rpc-auth ''

To list

    splunk _internal call /services/authentication/roles -get:search indexes_edit
    splunk _internal call /services/authentication/users -get:search john.smith
    splunk _internal call /services/authentication/users/john.smith -method DELETE

## Capacity Planning

There is a great online calculator at
[splunk-sizing.appspot.com](https://splunk-sizing.appspot.com).
