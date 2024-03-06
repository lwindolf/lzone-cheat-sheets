## CLI

You can access any sqlite database file, as long there is no other
client locking it, using the command line client to perform SQL
commands:

    sqlite3 <database file>

## List Schema

To list the schema of a sqlite database run

    SELECT name FROM sqlite_master;

It will dump all schema elements. One field of the result table contains
the SQL used to create each schema element. If you only want a list of
tables use the client command ".tables"

    .tables

## Exporting

### Cloning

    sqlite3 my.db ".clone my-clone.db"

### Dump Database as SQL

    sqlite3 my.db     ".dump" >backup.sql       # Dump
    sqlite3 my-new.db ".read backup.sql"        # Restore from dump    

### Dump Table as SQL

To dump the SQL to create a table and its values run the command line
client using the ".dump" command an redirect the output:

    sqlite3 <database file> ".dump <table name>" >output.sql

### Dump Table as CSV

To dump the SQL to create a table and its values run the command line
client using the ".mode" command to enable CSV output and then to
perform a "SELECT" on the table you want to dump. By echoing this to the
CLI you can easily redirect the output:

    echo ".mode csv
    select * from <table name>;" | sqlite3 >output.sql

## Cleanup with Vacuum

To run a one time cleanup just run the following command on an sqlite
database file. Ensure there is no program accessing the database file.
If there is it will fail and do nothing:

    sqlite3 my.db "VACUUM;"

## Configure Auto-Vacuum

If you want sqlite to perform vacuum on-demand you can set the
`auto_vacuum` pragma to either "INCREMENTAL" or "FULL":

    PRAGMA auto_vacuum = INCREMENTAL;
    PRAGMA auto_vacuum = FULL;

To quere the current `auto_vacuum` setting run

    PRAGMA auto_vacuum

## Fixing DBs with locks

If you have a broken locked DB file clone it to a new file (see section "Exporting")
and replace the broken one. Ensure to also cleanup WAL/SHM files otherwise the new one will not load.
