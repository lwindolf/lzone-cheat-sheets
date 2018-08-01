See also <?add topic='PgBouncer'?>

### SQL

Using Regular Expressions

You can edit column using regular expressions by running
regexp\_replace()

    UPDATE table SET field=regexp_replace(field, 'match pattern', 'replace string', 'g');

#### JSON Output

You can get Postgres to output JSON like this:

    SELECT row_to_json(<name of key column>) FROM ...

#### Analyze Queries

    EXPLAIN ANALYZE <sql statement>;

### Inspect an Installation

#### List Postgres Clusters

Under Debian use the pg\_wrapper command

    pg_lsclusters

#### List Postgres Settings

    SHOW ALL;

#### List Databases and Sizes

    SELECT pg_database.datname, pg_size_pretty(pg_database_size(pg_database.datname)) AS size FROM pg_database;

#### Show Running Queries in Postgres

    SELECT * FROM pg_stat_activity;

#### Show Blocking Locks

     SELECT bl.pid AS blocked_pid, a.usename AS blocked_user, 
             kl.pid AS blocking_pid, ka.usename AS blocking_user, a.current_query AS blocked_statement
      FROM pg_catalog.pg_locks bl
           JOIN pg_catalog.pg_stat_activity a
           ON bl.pid = a.procpid
           JOIN pg_catalog.pg_locks kl
                JOIN pg_catalog.pg_stat_activity ka
                ON kl.pid = ka.procpid
           ON bl.transactionid = kl.transactionid AND bl.pid != kl.pid
      WHERE NOT bl.granted ;

#### Show Table Usage

If you want to know accesses or I/O per table or index you can use the
pg\_stat\_\*\_tables and pg\_statio\_\*\_tables relations. For example:

    SELECT * FROM pg_statio_user_tables;

to show the I/O caused by your relations. Or for the number of accesses
and scan types and tuples fetched:

    SELECT * FROM pg_stat_user_tables;

### Troubleshooting

#### Changing Live Settings

    ALTER SYSTEM SET <setting> TO <value>;
    SELECT pg_reload_conf();

#### Kill Postgres Query

First find the query and it's PID:

    SELECT procpid, current_query FROM pg_stat_activity;

And then kill the PID on the Unix shell. Or use

    SELECT pg_terminate_backend('12345');

#### Kill all Connections to a DB

The following was suggested
[here](http://varwww.com/2013/06/16/kill-postgresql-backend-connections/).
Replace "TARGET\_DB" with the name of the database whose connections
should be killed.

    SELECT pg_terminate_backend(pg_stat_activity.procpid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'TARGET_DB';

#### Checking Replication

Compared to MySQL checking for replication delay is rather hard. It is
usually good to script this or use ready monitoring tools (e.g. Nagios
Postgres check). Still it can be done manually by running this command
on the master:

    SELECT pg_current_xlog_location();

and those two commands on the slave:

    SELECT pg_last_xlog_receive_location();
    SELECT pg_last_xlog_replay_location()

The first query gives you the most recent xlog position on the master,
while the other two queries give you the most recently received xlog and
the replay position in this xlog on the slave. A Nagios check plugin
could look like this:

    #!/bin/bash

    # Checks master and slave xlog difference...
    # Pass slave IP/host via $1

    PSQL="psql -A -t "

    # Get master status
    master=$(echo "SELECT pg_current_xlog_location();" | $PSQL)

    # Get slave receive location
    slave=$(echo "select pg_last_xlog_replay_location();" | $PSQL -h$1)

    master=$(echo "$master" | sed "s/\/.*//")
    slave=$(echo "$slave" | sed "s/\/.*//")

    master_dec=$(echo "ibase=16; $master" | bc)
    slave_dec=$(echo "ibase=16; $slave" | bc)
    diff=$(expr $master_dec - $slave_dec)

    if [ "$diff" == "" ]; then
        echo "Failed to retrieve replication info!"
        exit 3
    fi

    # Choose some good threshold here...
    status=0
    if [ $diff -gt 3 ]; then
        status=1
    fi
    if [ $diff -gt 5 ]; then
        status=2
    fi

    echo "Master at $master, Slave at $slave , difference: $diff"
    exit $status

### Postgres Backup Mode

To be able to copy Postgres files e.g. to a slave or a backup you need
to put the server into backup mode.

    SELECT pg_start_backup('label', true);
    SELECT pg_stop_backup();

Read more: [Postgres - Set Backup
Mode](http://www.postgresql.org/docs/9.1/static/continuous-archiving.html#BACKUP-BASE-BACKUP)

### Pooling / Failover / LB

There are two connection pooling solutions for Postgres both providing
read traffic load balancing and HA for read only slaves:

-   -   [PgPool II](http://pgpool.net)

Additionally there is [repmgr](http://www.repmgr.org/) which manages and
monitors replication and has automatic slave promotion on master
failure.

### Log Analysis

-   [pgFouine](http://pgfouine.projects.pgfoundry.org/)

### Further Reading

#### Online

-   [Scaling Postgres with pgpool and
    pgbouncer](http://girders.org/blog/2012/09/29/scaling-postgresql-with-pgpool-and-pgbouncer/)

#### Books

The must have reading for Postgres is for sure this book:\
  
