---
related:
  cheat-sheet: ['Kernel Tracing','GCC']
---

### Debugging / Performance Tools

-   List last reboots

        last reboot

-   Reboot when /sbin is unusable

        echo b >/proc/sysrq-trigger

-   List Context Switches per Process

        pidstat -w

-   Drop Filesystem Cache

        echo 1 > /proc/sys/vm/drop_caches

-   Disk Performance Test

        hdparm -tT /dev/...

-   [dmesg - block IO
    debugging](http://rajar.am/post/555326598/identifying-process-causing-lots-of-iowait):

        echo 1 > /proc/sys/vm/block_dump

        # wait some time...
        echo 0 > /proc/sys/vm/block_dump

        # Now check syslog for block dump lines

-   Check for changed sysctl() settings:

        sysctl -p

-   [Tuning sysctl for busy large
    server](http://www.enigma.id.au/linux_tuning.txt)
-   [TCP/IP tuning for
    scaling](http://www.lognormal.com/blog/2012/09/27/linux-tcpip-tuning/)
-   Increase max connection settings

        sysctl -w net.core.somaxconn=1024
        sysctl -w net.core.netdev_max_backlog=16000

-   SYN flood protection: Count connections

        netstat -n -p TCP | grep SYN_RECV | grep $port | wc -l
        netstat -s -P tcp | grep tcpHalfOpenDrop

    and change settings

        sysctl -w net.ipv4.tcp_syncookies=1     # Set enabled
        sysctl -w net.ipv4.tcp_max_syn_backlog=8192 # Increase as needed
        sysctl -w net.ipv4.tcp_fin_timeout=30       # Lower timeout as needed

-   [HTP Support
    Docs](https://www.kernel.org/doc/Documentation/vm/hugetlbpage.txt):

        sysctl -a | grep hugepage
        cat /proc/meminfo | grep HugePage

-   Enable OOM killer:

        sysctl vm.overcommit_memory=0
        sysctl vm.oom_kill_allocating_task=1

-   Disable OOM killer:

        sysctl vm.overcommit_memory=2

-   [dmesg - Filtering Output](/blog/Filtering+dmesg+Output):

        dmesg -T      # Enable human readable timestamps
        dmesg -x      # Show facility and log level
        dmesg -f daemon     # Filter for facility daemon
        dmesg -l err,crit,alert,emerg # Filter for errors

- Find files locked

      lslocks
    
-   [lsof](http://danielmiessler.com/study/lsof/) - Find owners of open
    file handles:

        lsof      # Complete list
        lsof -i :22    # Filter single TCP port
        lsof [email protected]:22 # Filter single connection endpoint
        lsof -u <user>   # Filter per user
        lsof -c <name>   # Filter per process name
        lsof -p 12345    # Filter by PID
        lsof /etc/hosts   # Filter single file

-   [Perf
    Tutorial](https://perf.wiki.kernel.org/articles/t/u/t/Tutorial.html):
    2.6+ generic kernel performance statistics tool.

        perf stat -B some_command

-   [dstat](http://dag.wieers.com/home-made/dstat/): Replaces vmstat,
    iostat, netstat and ifstat and allows to determine PID that is most
    CPU and most I/O expensive

        dstat -a --top-bio --top-cpu

-   [iotop](http://guichaz.free.fr/iotop/): Python script to monitor I/O
    like top
-   [Sysdig](https://github.com/draios/sysdig/wiki/Sysdig%20Examples):
    Some of the project examples

        sysdig fd.name contains /etc
        sysdig -c topscalls_time    # Top system calls
        sysdig -c topfiles_time proc.name=httpd    # Top files by process
        sysdig -c topfiles_bytes     # Top I/O per file
        sysdig -c fdcount_by fd.cip "evt.type=accept"   # Top connections by IP
        sysdig -c fdbytes_by fd.cip  # Top bytes per IP

        # Monitor directory
        sysdig evt.type=open and fd.name contains /var/

        # Monitor latency >1ms
        sysdig -c fileslower 1

        # Track I/O of a process
        sysdig -A -c echo_fds proc.name=httpd

        # Sick MySQL check via Apache
        sysdig -A -c echo_fds fd.sip=192.168.30.5 and proc.name=apache2 and evt.buffer contains SELECT

        sysdig -cl # List plugins
        sysdig -c bottlenecks  # Run bottlenecks plugin

        # To install sysdig
        curl -s https://s3.amazonaws.com/download.draios.com/stable/install-sysdig | sudo bash


