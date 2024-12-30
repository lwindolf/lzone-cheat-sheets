## Starting GDB

Ensure you always get debug symbols

    export CFLAGS="-Wall -ggdb"

Loading an existing core file

    gdb <binary> --core=<core file>

## Creating core dumps

Ensure a crashing application creates a core dump

    ulimit -c unlimited

Now run your application and a `core` file in the current directory should be created.

## GDB CLI

    bt                        # Show call stack
    thread apply all bt       # Show call stack for all threads

    frame <nr>                # Enter frame of the call stack
    print <name>              # Print scalar value
    print *<object>           # Print struct members
    print *(MyObject *)<ptr>  # Cast pointer to type and print it (can be nested!)
    print obj->member         # Access members by pointer

    break <symbol>            # Set breakpoint on symbol
    break <file:line>         # Set breakpoint on code line

    s                         # Step to next code line (short for "step")
    c                         # Continue execution (short for "continue")
    
    set -- arg1 arg2 ...      # Set arguments for your program
    run                       # ... and run it again

    set print elements 10000     # Print the string buffers with up to 10k chars
    set debuginfod enabled off   # Disable debug info download from internet
      
All `set` options given above can be added in `~/.gdbinit`

## Other GLib ways for debugging memory leaks

- Glib - mtrace(): Enable tracing by calling mtrace() right on startup
    and set environment variable

        export MALLOC_TRACE=alloc.log

    and analyze the result log with

        mtrace [<executable>] alloc.log

- Glib - Slice Allocation Checking

        export G_SLICE=debug-blocks
        
- GObject Reference Tracking with [gobject-list](https://github.com/danni/gobject-list)

        LD_PRELOAD=/path/to/libgobject-list.so <executable>

