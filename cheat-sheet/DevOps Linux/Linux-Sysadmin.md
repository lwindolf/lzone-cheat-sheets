---
related:
  cheat-sheet: ['LVM','RAID',Partitioning','Security']
---

## Hardware

### Info

Commands

        lsusb
        lspci
        lsha
        dmidecode
        dmidecode -s system-product-name
        hdparm -I /dev/....
        smartctl -a /dev/...

### Performance

#### I/O

-   [fio](http://www.bluestop.org/fio/): Synthetic IO stress test
-   [iozone](http://www.iozone.org/): Synthetic FS benchmark

#### I/O Scheduler

Get available and selected disk I/O scheduler

    cat /sys/block/sda/queue/scheduler
    
Set Linux disk IO scheduler

    echo deadline > /sys/block/sda/queue/scheduler

[How to enable BFQ scheduler with udev](https://community.chakralinux.org/t/how-to-enable-the-bfq-i-o-scheduler-on-kernel-4-12/6418/16)

#### CPU

-   [whetstone](http://www.roylongbottom.org.uk/whetstone.htm)
-   [dhrystone](http://www.netlib.org/benchmark/dhry-c)
-   [stress](https://packages.debian.org/sid/stress)

#### CPU Scheduler

Check and change scheduler settings with schedtool

    schedtool <pid>                  # Print settings for given PID
    schedtool -r                     # Show scheduler class prio ranges
    schedtool -R -p 20 -e <command>  # Run command with SCHED_RR and nice 20
        
List per-process scheduler settings 

    ps -wweALo pid,spid,user,priority,ni,pcpu,vsize,time,args

Check CPU freq governor

    cat /sys/devices/system/cpu/cpufreq/policy*/scaling_governor

Check SCHED_ISO settings

    cat /proc/sys/kernel/iso_cpu

#### Metrics

Human readable sar output

    sar -n DEV 1 1 # e.g. show recent Device I/O 

    # Save one complete sample if you have no collection enabled 
    sar -o /tmp/sar.out -n ALL 1 1 

Machine readable: you need to use sadf

    sadf -j /tmp/sar.out -- -n DEV    # All in nice JSON

#### Theory

-   [USE (Utilization Saturation and Errors)
    Method](http://www.brendangregg.com/usemethod.html)
-   [Docker Perfomance
    Analysis](http://www.brendangregg.com/blog/2017-05-15/container-performance-analysis-dockercon-2017.html)
-   [CPU Utilization is
    wrong](http://www.brendangregg.com/blog/2017-05-09/cpu-utilization-is-wrong.html?utm_content=bufferfb890&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer)

### Misc

- Find broken links

      find . -xtype l

-   Check for pending leap seconds:

        ntpq -c"rv 0 leap"

-   supervisor - Start CLI with

        supervisorctl

    CLI Commands

        start <name>
        stop <name>
        restart all
        tail <name>   # JSON log

-   sudo - Solving issue

        nagios sudo: no tty present and no askpass program specified

    by adding

        Defaults:<user name> !requiretty
        Defaults:<user name> !visiblepw

    at the end of /etc/sudoers. Note that this issue can also indicate a
    password prompt when you run a different command than you expect. In
    any case if you can't solve it check /var/log/auth.log to see what
    the real command is.

-   sudo - List user permissions:

        sudo -l -U <user>

-   pv - Visualize pipe progress:

        pv -cN source < linux-3.4.0.tar.bz2 | bzcat | pv -cN bzcat | gzip -9 | pv -cN gzip > linux-3.4.0.tar.gz

-   Fix broken text encoding:

        iconv -c -t ASCII input.txt
        iconv -c -t latin1 input.txt

-   screen - Detect other users sessions

        screen -ls <user name>/

-   screen - Allow othe users in our screen

        Ctrl-A :multiuser on
        Ctrl-A :acladd <user to grant access>

-   screen - Attach to other users screen session

        screen -x <user name>/<session name>
        screen -x <user name>/<pid>.<ptty>.<host>

-   screen - [Solve "Cannot open your terminal
    '/dev/pts/0'"](http://makandracards.com/makandra/2533-solve-screen-error-cannot-open-your-terminal-dev-pts-0-please-check):

        # Sign in as user who opened the screen
        script /dev/null
        screen -x

-   Avoid leap second problems:
    - Variant 1: Disable NTP, skip over second

          # before leap second
          /etc/init.d/ntp stop

          # after leap second
          date -s "$(LC_ALL=C date)"    Note: check correct locale!
          /etc/init.d/ntp start

    -   Variant 2: Ensure NTP is up-to-date and running with -x
    -   Variant 3: [Converging solution](http://syslog.me/2015/06/04/a-humble-attempt-to-work-around-the-leap-second-2015-edition/)

-   rsyslog - Modify rate imux limiting

        $SystemLogRateLimitInterval 2
        $SystemLogRateLimitBurst 50  # increase this

-   Running parallel SSH sessions using xargs

        echo "$hosts" | xargs --replace={} -t -n 1 -P 15 sh -c "ssh -o StrictHostKeyChecking=no -o PreferredAuthentications=publickey {} date || :"

## Runlevel

-   update-rc.d Examples

        update-rc.d apache2 defaults          # creates S20/K20 links
        update-rc.d apache2 defaults <nr>       # S<nr>/K<nr>
        update-rc.d apache2 defaults <nr1> <nr2>  # S<nr1>/K<nr2>

        # Really specific 
        update-rc.d apache2 start 20 2 3 4 5 . stop 80 0 1 6 .

        update-rc.d -f apache2 remove             # Cleanup

## Linux CPU Scheduler

Check if CFS is default scheduler

    grep cfs_rq /proc/sched_debug
    
Check if there are processes not running with CFS (SCHED_OTHER)

    ps -ef|grep [0-9]|awk '\{system("chrt -p " $2);print $0}' | grep -Ev 'priority|SCHED_OTHER' |grep -A1 SCHED
