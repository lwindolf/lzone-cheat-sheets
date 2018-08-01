This cheat sheet provides a systematic way to debug problems with system limits. Follow those steps and you can be sure that you find the problem or prove that there is no limit related problem.

## 1. Do not rely on ulimit anymore!

This is the most important takeaway. Given that modern init systems (systemd, upstart, start-stop-daemon) do not care about /etc/security/limits.conf anymore **it is not safe to rely on ulimit anymore!**

No matter what 

    ulimit -a

and 

    cat /etc/security/limits.conf
    cat /etc/security/limits.d/*.conf
   
might still tell you it affects only process you directly start from your shell.

As soon as you use a command like

    systemctl <name> restart
    service restart <name> 
    /etc/init.d/<name> restart

those limits **probably** won't have any effect.

## 2. Always Check Effective Limit using prlimit

Check the per-process limit using

    prlimit --pid=<pid>

or

    cat /proc/<pid>/limits

prlimit has the more readable output:

    RESOURCE   DESCRIPTION                             SOFT      HARD UNITS
    AS         address space limit                unlimited unlimited Bytes
    CORE       max core file size                         0 unlimited blocks
    CPU        CPU time                           unlimited unlimited seconds
    DATA       max data size                      unlimited unlimited Bytes
    FSIZE      max file size                      unlimited unlimited blocks
    LOCKS      max number of file locks held      unlimited unlimited 
    MEMLOCK    max locked-in-memory address space     65536     65536 Bytes
    MSGQUEUE   max bytes in POSIX mqueues            819200    819200 Bytes
    NICE       max nice prio allowed to raise             0         0 
    NOFILE     max number of open files               65536     65536 
    NPROC      max number of processes                15072     15072 
    RSS        max resident set size              unlimited unlimited pages
    RTPRIO     max real-time priority                     0         0 
    RTTIME     timeout for real-time tasks        unlimited unlimited microsecs
    SIGPENDING max number of pending signals          15072     15072 
    STACK      max stack size                       8388608 unlimited Bytes

**Note:** Running "prlimit" or "ulimit -a" in the shell of the
respective user rarely tells something because the init daemon
responsible for launching services might be ignoring
/etc/security/limits.conf as this is a configuration file for PAM only
and is applied on login only per default.

### Live update limits with prlimit

If you identified processes with a limit issue you can increase the limits without restarting by using prlimit.
Here are some examples

    prlimit --pid <pid> --nofile=15000:15000        # Increase nr of files to 15000
    prlimit --pid <pid> --core=100000000:100000000  # Allow ~100MB core dump

General syntax is

    prlimit --pid <pid> --<resource>=<soft limit>:<hard limit>
    

## 3. Always Check Global File Limit

If you suspect a limit hit on a system with many processes also check
the global limit:

    $ cat /proc/sys/fs/file-nr
    7488    0   384224

The first number is the number of all open files of all processes, the
third is the maximum. If you need to increase the maximum run:

    # sysctl -w fs.file-max=500000

Ensure to persist this in /etc/sysctl.conf to not loose the setting on next reboot.

## 4. Check "nofile" Per Process

Just checking the number of files per process often helps to identify
bottlenecks. For every process you can count open files from using lsof:

    lsof -n -p <pid> | wc -l

So a quick check on a burning system might be:

    lsof -n 2>/dev/null | awk '{print $1 " (PID " $2 ")"}' | sort | uniq -c | sort -nr | head -25

which returns the top 25 file descriptor "eating" processes

     139 mysqld (PID 2046)
     105 httpd2-pr (PID 25956)
     105 httpd2-pr (PID 24384)
     105 httpd2-pr (PID 24377)
     105 httpd2-pr (PID 24301)
     105 httpd2-pr (PID 24294)
     105 httpd2-pr (PID 24239)
     105 httpd2-pr (PID 24120)
     105 httpd2-pr (PID 24029)
     105 httpd2-pr (PID 23714)
     104 httpd2-pr (PID 3206)
     104 httpd2-pr (PID 26176)
     104 httpd2-pr (PID 26175)
     104 httpd2-pr (PID 26174)
     104 httpd2-pr (PID 25957)
     104 httpd2-pr (PID 24378)
     102 httpd2-pr (PID 32435)
     53 sshd (PID 25607)
     49 sshd (PID 25601)

The same more comfortable including the hard limit:

    lsof -n 2>/dev/null | awk '{print $1,$2}' | sort | uniq -c | sort -nr | head -25 | while read nr name pid ; do printf "%10d / %-10d %-15s (PID %5s)\n" $nr $(cat /proc/$pid/limits | grep 'open files' | awk '{print $5}') $name $pid; done

returns

     105 / 1024 httpd2-pr (PID 5368)
     105 / 1024 httpd2-pr (PID 3834)
     105 / 1024 httpd2-pr (PID 3407)
     104 / 1024 httpd2-pr (PID 5392)
     104 / 1024 httpd2-pr (PID 5378)
     104 / 1024 httpd2-pr (PID 5377)
     104 / 1024 httpd2-pr (PID 4035)
     104 / 1024 httpd2-pr (PID 4034)
     104 / 1024 httpd2-pr (PID 3999)
     104 / 1024 httpd2-pr (PID 3902)
     104 / 1024 httpd2-pr (PID 3859)
     104 / 1024 httpd2-pr (PID 3206)
     102 / 1024 httpd2-pr (PID 32435)
     55 / 1024 mysqld (PID 2046)
     53 / 1024 sshd (PID 25607)
     49 / 1024 sshd (PID 25601)
     46 / 1024 dovecot-a (PID 1869)
     42 / 1024 python (PID 1850)
     41 / 1048576 named (PID 3130)
     40 / 1024 su (PID 25855)
     40 / 1024 sendmail (PID 3172)
     40 / 1024 dovecot-a (PID 14057)
     35 / 1024 sshd (PID 3160)
     34 / 1024 saslauthd (PID 3156)
     34 / 1024 saslauthd (PID 3146)

## 5. Consider Typical Pitfalls with Limits

### Systemd ignores /etc/security/limits.conf

When using systemd /etc/security/limits.conf doesn't apply anymore.
**Workaround:** The only way to increase limits is in the systemd unit
file. You can find out the name of the unit file using "systemctl status
\<service name\>". In the unit files [Service] section add a Limit line
like below:

    [Service]
    ...
    LimitNOFILE=8092

The old ulimit names match to Limit\<upper case limit name\> fields and
the value "unlimited" now is called "infinity"

### Init Scripts with start-stop-daemon ignore /etc/security/limits.conf

A typical mistake is trying to set limits for a daemon starting by a
Debian start script using "start-stop-daemon" which on modern distros just
delegates to systemd or on older distros isn't integrated with PAM and for
both reasons isn't affected by /etc/security/limits.conf.

**Workaround:** 
- On systemd: Set Limit in the systemd unit file
- Otherwise: Set the limits manually in the start script.

### Upstart ignores /etc/security/limits.conf

On older Ubuntu releases services are started by upstart which similar to 
systemd ignores /etc/security/limits.conf. To get upstart to
change the limits of a managed service you need to insert a line like

    limit nofile 10000 20000

into the upstart job file in /etc/init.

### Special Debian Apache Handling

The Debian Apache package which is also included in Ubuntu has a
separate way of configuring "nofile" limits. If you run the default
Apache in 12.04 and check /proc/\<pid\>/limits of a Apache process
you'll find it is allowing 8192 open file handles. No matter what you
configured elsewhere. This is because Apache defaults to 8192 files. If
you want another setting for "nofile" then you need to [edit
/etc/apache2/envvars](http://www.lzone.de/Ubuntu+Apache+and+ulimit).

## Login Session Workarounds

### When changing limits.conf re-login!

After you apply a change to /etc/security/limits.conf you need to login
again to have the change applied to your next shell instance by PAM.
Alternatively you can use [sudo -i](http://lzone.de/apply+limits+immediately) to 
switch to user whose limits you modified and simulate a login.
