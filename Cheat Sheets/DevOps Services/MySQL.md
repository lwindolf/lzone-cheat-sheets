## Show MySQL Status

You can get a very simple status by just entering "\\s" in the "mysql"
command line client prompt:

    mysql> \s

You can show the replication status using

    SHOW SLAVE STATUS \G
    SHOW MASTER STATUS \G

Note that the "\\G" instead of ";" just makes the output more readable.
If you have configured slaves to report names you can list them on the
master with:

    SHOW SLAVE HOSTS;

## Check InnoDB status

    show /*!50000 ENGINE*/ INNODB STATUS;

## List Databases/Tables/Colums

You can either use the "mysqlshow" tool:

    mysqlshow                         # List all databases
    mysqlshow <database>              # List all tables of the given database
    mysqlshow <database> <table>      # List all columns of the given table in the given DB

And you can also do it using queries:

    SHOW DATABASES;

    USE <database>;
    SHOW TABLES;
    DESCRIBE <table>;

## Check and Change Live Configuration Parameters

Note that you cannot change all existing parameters. Some like
innodb\_pool\_buffer require a DB restart.

    show variables;                          # List all configuration settings
    show variables like 'key_buffer_size';   # List a specific parameter

    set global key_buffer_size=100000000;    # Set a specific parameter

    # Finally ensure to edit my.cnf to make the change persistent

## MySQL Parameter Optimization

You can check MySQL parameters of a running instance using tools like

- [MySQLTuner](https://raw.github.com/rackerhacker/MySQLTuner-perl/master/mysqltuner.pl)
- [MySQL Tuning - Primer](https://launchpad.net/mysql-tuning-primer)
- [pt-variable-advisor](http://www.percona.com/doc/percona-toolkit/2.1/pt-variable-advisor.html)

Also have a look at this [MySQL config parameter
explanation](http://www.theadminzone.com/forums/showthread.php?t=8150).

## Remote MySQL Dump and Import

The following command allows dumping a database from one source host
that doesn't see the target host when executed on a third host that can
access both. If both hosts can see each other and one has SSH access to
the other you can simply drop one of the ssh calls.

    ssh <user@source host> "mysqldump --single-transaction -u root --password=<DB root pwd> <DB name>" | ssh <user@target host> "mysql -u root --password=<DB root pwd> <DB name>"

## Troubleshooting

### Connection refused

    mysqladmin flush-hosts

### How to solve: Could not find target log during relay log initialization

Happens on corrupted/missing relay logs. To get the DB working

-   Stop MySQL
-   Remove /var/lib/mysql/relay-log-index.\*
-   Remove all relay log files
-   Remove relog log file index
-   Start MySQL

### mysqldump: Error 2013: Lost connection to MySQL server during query when dumping table

This is caused by timeouts when copying overly large database tables.
The default network timeouts are very short per-default. So you can
workaround this by increasing network timeouts

    set global net_write_timeout = 100000;
    set global net_read_timeout = 100000;

### Dump Skip Event Table

If your MySQL backup tool or self-written script complains about an
event table than you have run into an issue caused by newer MySQL
versions (\>5.5.30) that introduced a new table "events" in the internal
schema. **If you run into this you need to decide wether you want to
include or exclude the new events table when dumping your database.** To
skip: Due to a MySQL bug
[\#68376](http://bugs.mysql.com/bug.php?id=68376) you have two choices.
You can check documentation and add the logical option

    --skip-events

which will cause the event table not to be exported. But the warning
won't go away. To also get rid of the warning you need to use this
instead:

    --events --ignore-table=mysql.events

And of course you can also choose just to dump the events table: Add the
option

    --events

to your "mysqldump" invocation. If you use a tool that invokes
"mysqldump" indirectly check if the tool allows to inject additional
parameters.

### Forgotten root Password

1. Stop MySQL and start without grant checks

       /usr/bin/mysqld_safe --skip-grant-tables

2. In another terminal

       mysql --user=root mysql

3. Change root password

       UPDATE user SET password=PASSWORD('xxxxx') WHERE user = 'root';

## Import a CSV file into MySQL

    LOAD DATA IN '<CSV filename>' INTO TABLE <table name> FIELDS TERMINATED BY ',' (<name of column #1>,<<name of column #2>,<...>);

## MySQL Pager - Output Handling

Using "PAGER" or \\P you can control output handling. Instead of having
10k lines scrolling by you can write everything to a file or use "less"
to scroll through it for example. To use less issue

    pager less

Page output into a script

    pager /home/joe/myscript.sh

Or if you have Percona installed get a tree-like "EXPLAIN" output with

    pager mk-visual-explain

and then run the "EXPLAIN" query.

## MySQL - Check Query Cache

    # Check if enabled
    SHOW VARIABLES LIKE 'have_query_cache';

    # Statistics
    SHOW STATUS LIKE 'Qcache%';

## Check for currently running MySQL queries

    show processlist;
    show full processlist;

Filter items in process list by setting grep as a pager. The following
example will only print replication connections:

    \P grep system
    show processlist;

Find top long running queries

    SELECT id,host,state,command,time,left(replace(info,'\n','<lf>'),120)
    FROM information_schema.processlist
    WHERE command <> 'Sleep' 
    AND info NOT LIKE '%PROCESSLIST%'
    ORDER BY time DESC LIMIT 25;

To abort/terminate a statement determine it's id and kill it:

    kill <id>;    # Kill running queries by id from process listing

## Show Recent Commands

    SHOW BINLOG EVENTS;
    SHOW BINLOG EVENTS IN '<some bin file name>';

## Inspect a MySQL binlog file

There is an extra tool to inspect bin logs:

    mysqlbinlog <binary log file>

## Skip one statement on replication issue HA\_ERR\_FOUND\_DUPP\_KEY

If replication stops with "HA\_ERR\_FOUND\_DUPP\_KEY" you can skip the
current statement and continue with the next one by running:

    STOP SLAVE;
     SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1;
    START SLAVE;

## Changing Replication Format

When you want to change the replication format of a running setup you
might want to follow this steps:

1.  Ensure you have a database backup
2.  Make master read-only by running

        FLUSH TABLES WITH READ LOCK;

3.  Wait until all slaves do catch up
4.  Stop all slaves (shutdown MySQL)
5.  On master:

        FLUSH LOGS;
        SET GLOBAL binlog_format='xxxxxx';
        FLUSH LOGS;
        UNLOCK TABLES;

    (ensure to replace 'xxxxxx' with for example 'ROW')

6.  Start all slaves
7.  Ensure to put the new binlog\_format in all /etc/mysql/my.cnf

Note: the second "FLUSH LOGS;" ensures that the a new binary log is
opened on the master with the new binlog\_format. The stopping of the
slaves ensures that they open a new relay log matching the new
binlog\_format.

## Monitoring

### Munin MySQL Plugin Setup on Debian

    apt-get install libcache-cache-perl

    for i in `./mysql_ suggest`
    do
       do ln -sf /usr/share/munin/plugins/mysql_ $i;
    done

    /etc/init.d/munin-node reload

### Live CLI Monitoring of MySQL

There are two useful tools:

-   mytop
-   innotop

with "mytop" being an own Debian package, while "innotop" is included in
the "mysql-client" package. From both innotop has the more advanced
functionality. Both need to be called with credentials to connect to the
database:

    mytop -u <user> -p<password>
    innotop -u <user> -p<password>

Alternatively you can provide a .mytop file to provide the credentials automatically.

## Fix Slow Replication

When replication is slow check the status of the replication connection.
If it is too often in "invalidating query cache" status you need to
decrease your query cache size. You might even consider disabling query
cache for the moment if the DB load does allow it:

    set global query_cache_size=0;

## Debug DB Response Time

There is generic TCP response analysis tool developed by Percona called
[tcprstat](http://www.percona.com/docs/wiki/tcprstat:start). Download
the binary from Percona, make it executable and run it like

    tcprstat -p 3306 -t 1 -n 0

to get continuous statistics on the response time. This is helpful each
time some developer claims the DB doesn't respond fast enough!
 
