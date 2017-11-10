This is a check list of all you can do wrong when trying to set limits
on Debian/Ubuntu. The hints might apply to other distros too, but I
didn't check. If you have additional suggestions please leave a comment!

### Checking Limits

#### Always Check Effective Limit

Using one of those two commands:

    prlimit --pid=<pid>
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

 

#### Do Not Forget The OS File Limit

If you suspect a limit hit on a system with many processes also check
the global limit:

    $ cat /proc/sys/fs/file-nr
    7488    0   384224
    $

The first number is the number of all open files of all processes, the
third is the maximum. If you need to increase the maximum:

    # sysctl -w fs.file-max=500000

Ensure to persist this in /etc/sysctl.conf to not loose it on reboot.

#### Check "nofile" Per Process

Just checking the number of files per process often helps to identify
bottlenecks. For every process you can count open files from using lsof:

    lsof -n -p <pid> | wc -l

So a quick check on a burning system might be:

    lsof -n 2>/dev/null | awk '{print $1 " (PID " $2 ")"}' | sort | uniq -c | sort -nr | head -25

whic returns the top 25 file descriptor eating processes

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

 

### Usual Pitfalls

#### Systemd Unit Files

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

#### Init Skripts with start-stop-daemon

A typical mistake is trying to set limits for a daemon starting by a
Debian start script using "start-stop-daemon" which isn't integrated
with PAM and isn't affected by /etc/security/limits.conf.

**Workaround:** Set the limits manually in the start script.

#### Upstart doesn't care about limits.conf!

The most common mistake is believing upstart behaves like the Debian
init script handling. When on Ubuntu a service is being started by
upstart /etc/security/limits.conf will never apply! To get upstart to
change the limits of a managed service you need to insert a line like

    limit nofile 10000 20000

into the upstart job file in /etc/init.

 

#### Special Debian Apache Handling

The Debian Apache package which is also included in Ubuntu has a
separate way of configuring "nofile" limits. If you run the default
Apache in 12.04 and check /proc/\<pid\>/limits of a Apache process
you'll find it is allowing 8192 open file handles. No matter what you
configured elsewhere. This is because Apache defaults to 8192 files. If
you want another setting for "nofile" then you need to [edit
/etc/apache2/envvars](http://www.lzone.de/Ubuntu+Apache+and+ulimit).

### Workarounds

#### When changing limits.conf re-login!

After you apply a change to /etc/security/limits.conf you need to login
again to have the change applied to your next shell instance by PAM.
Alternatively you can use [sudo
-i](http://lzone.de/apply+limits+immediately) to switch to user whose
limits you modified and simulate a login.

#### For Emergencies: prlimit!

Starting with util-linux-2.21 there will be a [new "prlimit"
tool](http://karelzak.blogspot.de/2012/01/prlimit1.html) which allows
you to easily get/set limits for running processes. Sadly Debian is and
will be for some time on util-linux-2.20. So what do we do in the
meantime? The prlimit(2) manpage which is for the system call prlimit()
gives a hint: at the end of the page there is a code snippet to change
the CPU time limit. You can adapt it to any limit you want by replacing
RLIMIT\_CPU with any of

-   RLIMIT\_NOFILE
-   RLIMIT\_OFILE
-   RLIMIT\_AS
-   RLIMIT\_NPROC
-   RLIMIT\_MEMLOCK
-   RLIMIT\_LOCKS
-   RLIMIT\_SIGPENDING
-   RLIMIT\_MSGQUEUE
-   RLIMIT\_NICE
-   RLIMIT\_RTPRIO
-   RLIMIT\_RTTIME
-   RLIMIT\_NLIMITS

You might want to check "/usr/include/\$(uname
-i)-linux-gnu/bits/resource.h". Check the next section for an ready made
example for "nofile".

 

#### Build Your Own set\_nofile\_limit

The per-process limit most often hit is propably "nofile". Imagine you
production database suddenly running out of files. Imagine a tool that
can instant-fix it without restarting the DB! Copy the following code to
a file "set\_limit\_nofile.c"

    #define _GNU_SOURCE
    #define _FILE_OFFSET_BITS 64
    #include <stdio.h>
    #include <time.h>
    #include <stdlib.h>
    #include <unistd.h>
    #include <sys/resource.h>

    #define errExit(msg) do { perror(msg); exit(EXIT_FAILURE); \
     } while (0)

    int
    main(int argc, char *argv[])
    {
     struct rlimit old, new;
     struct rlimit *newp;
     pid_t pid;

     if (!(argc == 2 || argc == 4)) {
     fprintf(stderr, "Usage: %s <pid> [<new-soft-limit> "
     "<new-hard-limit>]\n", argv[0]);
     exit(EXIT_FAILURE);
     }

     pid = atoi(argv[1]); /* PID of target process */

     newp = NULL;
     if (argc == 4) {
     new.rlim_cur = atoi(argv[2]);
     new.rlim_max = atoi(argv[3]);
     newp = &new;
     }

     if (prlimit(pid, RLIMIT_NOFILE, newp, &old) == -1)
     errExit("prlimit-1");
     printf("Previous limits: soft=%lld; hard=%lld\n",
     (long long) old.rlim_cur, (long long) old.rlim_max);

     if (prlimit(pid, RLIMIT_NOFILE, NULL, &old) == -1)
     errExit("prlimit-2");
     printf("New limits: soft=%lld; hard=%lld\n",
     (long long) old.rlim_cur, (long long) old.rlim_max);

     exit(EXIT_FAILURE);
    }

and compile it with

    gcc -o set_nofile_limit set_nofile_limit.c

And now you have a tool to change any processes "nofile" limit. To dump
the limit just pass a PID:

    $ ./set_limit_nofile 17006
    Previous limits: soft=1024; hard=1024
    New limits: soft=1024; hard=1024
    $

To change limits pass PID and two limits:

    # ./set_limit_nofile 17006 1500 1500
    Previous limits: soft=1024; hard=1024
    New limits: soft=1500; hard=1500
    # 

And the production database is saved.
