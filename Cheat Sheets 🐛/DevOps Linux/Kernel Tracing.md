## Frameworks

-   [Kernel Trace Systems](http://elinux.org/Kernel_Trace_Systems)
    Overview
-   [Core Dumps with Ubuntu](http://askubuntu.com/questions/148536/how-to-enable-sigquit-core-dumps-with-apport):
    Ubuntu per-default redirects cores to its bug reporting tool
    "apport" so you won't get core dumps. If you still need to overrule
    the core dump pipe in /proc/sys/kernel/core\_pattern:

        echo core >/proc/sys/kernel/core_pattern 

-   [Dtrace for Linux](http://dtrace.org/blogs/ahl/2011/10/05/dtrace-for-linux-2):
    the Solaris framework ported by Sun/Oracle
-   [FTrace](https://burzalodowa.wordpress.com/2013/07/09/linux-kernel-tracing/):
    kernel trace point injection
-   [Task Stats](http://www.mjmwired.net/kernel/Documentation/accounting/taskstats.txt):
    per-task accounting in Linux
-   [ktap](http://www.ktap.org): Runs with just a kernel module without
    debugging symbols, requires debugfs
-   [FlameGraph](https://github.com/brendangregg/FlameGraph): generate
    call stack volume graphs for SystemTap, DTrace, Perf...
    
### Tutorials

- https://github.com/goldshtn/linux-tracing-workshop

### Event Tracing

[Documentation](https://www.kernel.org/doc/Documentation/trace/events.txt)

    mount -t debugfs none /sys/kernel/debug

    # Variant 1
    echo "sched_wakeup"  >> /sys/kernel/debug/tracing/set_event
    echo "!sched_wakeup" >> /sys/kernel/debug/tracing/set_event
    echo "sched:*"        > /sys/kernel/debug/tracing/set_event

    # Variant 2
    echo 1 > /sys/kernel/debug/tracing/events/sched/sched_wakeup/enable
    echo 0 > /sys/kernel/debug/tracing/events/sched/sched_wakeup/enable
    echo 1 > /sys/kernel/debug/tracing/events/sched/enable

    # Available events
    find /sys/kernel/debug/tracing/events/sched

    # To add trace points from boot loader, add
    trace_event=<event name>

    # Setting triggers: stacktrace, snapshot, traceon/off
    # -> Always stracktrace
    echo 'stacktrace' > /sys/kernel/debug/tracing/events/<event>/trigger

    # -> Snapshot on next event
    echo 'snapshot if nr_rq > 1' > /sys/kernel/debug/tracing/events/<event>/trigger

### Perf Probe

    apt-get install linux-tools-common linux-tools-generic

    perf probe --line vfs_read
    perf probe --add 'vfs_read file file->f_mode'
    perf probe --list

    # Trace Event
    perf trace                         # Trace to terminal (useless because terminal feedback loop)
    perf trace <command>               # Trace a command execution

    perf record -e "syscalls:*" ls     # Record system calls on execution of "ls"
    perf record -e "syscalls:*" -aR       # Record all processes until Ctrl-C is pressed

    # Note: when "syscalls" does not exist try "raw_syscalls"

    perf list                          # For list of possible -e filters

    perf report -i perf.data

    # Delete Event
    perf probe --del '*'

#### Misc perf stuff

-   [perf Flame Graphs](http://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html)
-   [perf Java Symbols Mapper Agent](https://github.com/jrudolph/perf-map-agent)
-   [Direct JVM Symbol Mapping](http://techblog.netflix.com/2015/07/java-in-flames.html)
    with -XX:+PreserveFramePointer

### SystemTap

-   [System Tap](http://sourceware.org/systemtap/index.html): Tracing
    framework by Red Hat, IBM, Hitachi, and Oracle.
-   [System Tap on Debian](http://sourceware.org/systemtap/wiki/SystemtapOnDebian#head-81631b554b54f056056424eb4895912b67225b17):
    Installation HowTo
-   [System Tap on Ubuntu](https://wiki.ubuntu.com/Kernel/Systemtap):
    Installation HowTo, short version below

        apt-get install systemtap systemtap-doc

        # Install kernel debug symbols
        codename=$(lsb_release -c | awk  '{print $2}')
        sudo tee /etc/apt/sources.list.d/ddebs.list << EOF
        deb http://ddebs.ubuntu.com/ ${codename}      main restricted universe multiverse
        deb http://ddebs.ubuntu.com/ ${codename}-security main restricted universe multiverse
        deb http://ddebs.ubuntu.com/ ${codename}-updates  main restricted universe multiverse
        deb http://ddebs.ubuntu.com/ ${codename}-proposed main restricted universe multiverse
        EOF

        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ECDCAD72428D7C01
        sudo apt-get update
        sudo apt-get install linux-image-$(uname -r)-dbgsym

        # List existing SystemTap scripts
        dpkg -L systemtap-doc | grep "\.stp$"

        # Run a script
        /usr/share/doc/systemtap-doc/examples/io/iotop.stp

### oprofile

[statistical profiler for Linux (\<20% overhead)](http://oprofile.sourceforge.net/about/)

    # After boot run "init" and "setup" with or without kernel statistics
    opcontrol --init
    opcontrol --setup --no-vmlinux  
    opcontrol --setup --vmlinux=/usr/lib/debug/lib/modules/`uname -r`/vmlinux

    opcontrol --reset
    opcontrol --start
    opcontrol --dump
    opcontrol --shutdown

    # Per library/image summaries
    opreport
    opreport /usr/sbin/sshd # Limit to this binary

    # Call graph for one application
    opreport -cl --demangle=smart /usr/sbin/apache2

    # To resolve kernel symbols
    opreport --symbols --image-path=/lib/modules/<version>/kernel
