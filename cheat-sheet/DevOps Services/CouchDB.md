---
related:
   cheat-sheet: Couchbase
---

### Monitoring

    GET /_stats
    GET /_active_tasks

### HTTP Lifecycle API

#### Database Replication

The most confusing part about CouchDB is replication being enabled by a
manual HTTP request that specifies replication source and target.

    POST /_replicate
    {'source': 'http://myserver2/mydb', 'target': 'mydb', 'continuous': true, 'create_target': true}

Be sure to recheck the response JSON for "ok": "true"

#### Database Vacuum

    POST /<db>/_compact
    POST /<db>/_compact/designname

#### Cleaning Old Views

    POST /<db>/_view_cleanup

### HTTP Data API

#### Databases

    GET /_all_dbs       # returns JSON list of DB names
    GET /<db>        # returns JSON hash of infos for <db>
    PUT /<db>        # created DB <db>
    DELETE /<db>

#### Changes

    GET /<db>/_changes       # list changes, useful GET parameters:
                    #  
                    # since=<nr of seconds>
                    # timeout<nr of ms>

View live changes (update every 1s)

    GET /<db>/_changes?feed=continous&heartbeat=1000

#### Documents

    # Get List
    GET /<db>/_all_docs?limit=100
    GET /<db>/_all_docs?include_docs=true

    # Get Documents
    GET /<db>/doc?rev=<nr>

    POST /<db>/_all_docs
    {'keys':['my_document']}

    # Create Document
    POST /<db>/<id>
    {'name':'my_document'}

    DELETE /<db>/<id>

    # Bulk Update
    POST /<db>/_bulk_docs

#### Attachments

    GET /<db>/doc                # Get attachments list
    GET /<db>/doc/<name>          # Get attachments list
    PUT /<db>/doc                # Add an attachment
    DELETE /<db>/doc/<name>?rev=<revision> # And delete it...

#### Views

    GET /<db>/_design/<view>      # Get view definition
    GET /<db>/_design/<view>/_info        # Get view status
    GET /<db>/_design/<view>/<view name>   # Get view results

#### Lists

    GET /<db>/_design/<view>/_list/<list name>/<view name>

#### Show Functions

    GET /<db>/_design/<view>/_show/<show function>
    GET /<db>/_design/<view>/_show/<show function>/<document id>
    GET /<db>/_design/<view>/_show/<show function>/<document id>?<params>
