See also: <?add topic='Postgres'?>

### Debugging PgBouncer

To inspect pgbouncer operation ensure to add at least one user you
defined in the user credentials (e.g. /etc/pgbouncer/userlist.txt) to
the "stats\_users" key in pgbouncer.ini:

    stats_users = myuser

Use this user to connect to pgbouncer with psql by requesting the
"pgbouncer" database:

    psql -p 6432 -U myuser -W pgbouncer

At psql prompt list supported commands

    SHOW HELP;

PgBouncer will present all statistics and configuration options:

    pgbouncer=# SHOW HELP;
    NOTICE:  Console usage
    DETAIL:  
        SHOW HELP|CONFIG|DATABASES|POOLS|CLIENTS|SERVERS|VERSION
        SHOW STATS|FDS|SOCKETS|ACTIVE_SOCKETS|LISTS|MEM
        SET key = arg
        RELOAD
        PAUSE []
        SUSPEND
        RESUME []
        SHUTDOWN

The "SHOW" commands are all self-explanatory. Very useful are the
"SUSPEND" and "RESUME" commands when you use pools.

### Online Restart

If you ever need to restart pgbouncer under traffic load use "-R" to
avoid disconnecting clients. This option gets the new process to reuse
the Unix sockets of the old one. A possible use case could be that you
think pgbouncer has become stuck, overloaded or instable.

    pgbouncer -R

Aside from this in most cases SIGHUP should be fine.

### Pooler Error: Auth Failed

If connections to your pgbouncer setup fail with "Pooler Error: Auth
failed" check the following configuration values in your pgbouncer.ini

-   **auth\_file = ...** : Ensure to point this path to your pg\_auth
    file in your Postgres setup.
-   **auth\_type = ...** : Ensure to set the correct authentication
    type. E.g. "md5" for MD5 hashed passwords.
-   Check if your pg\_auth file has the needed passwords entries.

