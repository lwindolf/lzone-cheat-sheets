## Debugging Code

### GDB

- Ensure you always get debug symbols

    export CFLAGS="-Wall -ggdb"

-   [gdb - global thread
    dump](http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&ved=0CDYQFjAB&url=http%3A%2F%2Fsourceware.org%2Fgdb%2Fonlinedocs%2Fgdb%2FThreads.html&ei=pSehT_uNJcqj-gaq2aSjBw&usg=AFQjCNERBsV1ICcafttBSHv1XZKuRQlNHQ):

        threads apply all bt

-   gdb - pass arguments:

        set -- arg1 arg2 ...

-   [gdb - Print large
    strings](http://delicious.com/redirect?url=http%3A//sunsite.ualberta.ca/Documentation/Gnu/gdb-4.18/html_node/gdb_58.html):
    How to get gdb to always print the full string buffers:

        set print elements 10000

### Memory Leaks

-   Glib - mtrace(): Enable tracing by calling mtrace() right on startup
    and set environment variable

        export MALLOC_TRACE=alloc.log

    and analyze the result log with

        mtrace [<executable>] alloc.log

-   Glib - Slice Allocation Checking

        export G_SLICE=debug-blocks

-   Valgrind

        valgrind --leak-check=yes <executable> [ [...]]

