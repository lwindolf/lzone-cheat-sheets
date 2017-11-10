### Debugging

-   mdb - Analysing core files:

        $ mdb core.xxxx        # Open core file
        > ::status             # Print core summary

        > ::stacks             # Backtrace
        > ::stacks -v          # Backtrace verbose

        > ::quit

-   [Changing Solaris Kernel
    Parameters](http://docs.sun.com/app/docs/doc/817-0404/chapter1-9?a=view):

        # mdb -kw
        > maxusers/W 500
        > $q

-   Library Dependencies of a running process:

        pldd <pid>

-   Details of Memory Usage - pmap:

        # pmap 19463
        19463:  -sh
        08047000       4K rw---    [ stack ]
        08050000      76K r-x--  /sbin/sh
        08073000       4K rw---  /sbin/sh
        08074000      16K rw---    [ heap ]
        FEE60000      24K r-x--  /lib/libgen.so.1
        FEE76000       4K rw---  /lib/libgen.so.1
        FEE80000    1072K r-x--  /lib/libc.so.1
        FEF90000      24K rwx--    [ anon ]
        FEF9C000      32K rw---  /lib/libc.so.1
        FEFA4000       8K rw---  /lib/libc.so.1
        FEFC4000     156K r-x--  /lib/ld.so.1
        FEFF0000       4K rwx--    [ anon ]
        FEFF7000       4K rwxs-    [ anon ]
        FEFFB000       8K rwx--  /lib/ld.so.1
        FEFFD000       4K rwx--  /lib/ld.so.1
         total      1440K

-   [kstat API](http://developers.sun.com/solaris/articles/kstatc.html):
    Accessing Solaris kernel statistics using C-API
-   [infocmp - Compare terminal
    settings](http://gd.tuwien.ac.at/linuxcommand.org/man_pages/infocmp1.html):
    This is not Solaris specific, but you need it quite often.

        infocmp -L

-   [DTraceToolkit](http://www.solarisinternals.com/wiki/index.php/DTraceToolkit):
    Useful dtrace scripts for all types of debugging tasks.
-   [How to kill a Solaris
    machine](http://www.camelrichard.org/topics/Solaris/Three_Solaris_Hogs_for_Testing)
-   List/Set PROM Config

        eeprom
        eeprom <key>=<value>

-   Trace system calls

        truss -p <PID>

### Network

-   [snoop vs.
    tcpdump](http://stupidunixlinuxtricks.blogspot.com/2008/03/snoop-and-tcpdump.html):
    How to use snoop:

        snoop -v -d qfe0 -x0 host 192.168.1.87
        snoop -v -d qfe0 -x0 port 22

-   Show installed NIcs:

        dladm show-dev 
        dladm show-link

-   [iSCSI on Solaris](http://prefetch.net/articles/solarisiscsi.html)
-   [Find unknown
    NIC](http://gurkulindia.com/main/2011/04/soalris-find-network-interface-names-that-are-available-but-not-plumbed/):
    When you do not know the network interface name and don't want to
    guess: simple plumb all unplumbed NICs with

        ifconfig plumb -a

### Legacy

-   [Extend 256 file descriptor limit for 32bit binaries](): This
    requires preloading a helper library

        % ulimit -n 256

        % echo 'rlim_fd_max/D' | mdb -k | awk '{ print $2 }'  # determine allowed maximum
        65536

        % ulimit -n 65536

        % export LD_PRELOAD_32=/usr/lib/extendedFILE.so.1

-   Determine if Solaris is 32 or 64 bit:

        isainfo -b

### Monitoring

-   [SEtoolkit](http://sourceforge.net/projects/setoolkit/): Performance
    data gathering script collection based on orcallator.
-   [Orcallator](http://www.orcaware.com/orca/docs/orcallator.html):
    Provides a variety of Solaris specific probes.
-   [NICstat](http://www.brendangregg.com/K9Toolkit/nicstat.c): Source
    (C) for a monitoring NICs in Solaris. vmstat/iostat like command
    line client.
-   [Munin on
    Solaris](http://munin-monitoring.org/wiki/SolarisInstallation)

### Package Installation

-   Resolve File to Package:

        pkgchk -l -p /usr/bin/ls

### Service Management

-   svcs - List Service Infos

        svcs -a              # List all installed services and their current state
        svcs -d <service>    # List all dependencies of a service
        svcs -D <service>    # List who is depending on a service
        svcs -xv             # List why something is failed

-   svcadm - Control Services

        svcadm enable <service>
        svcadm disable <service>
        svcadm refresh <service>    # like init reload
        svcadm restart <service>

        svcadm clear <service>      # Clear errors: try starting again...

### General

-   [Jumpstart
    HowTo](http://www.brandonhutchinson.com/Solaris_JumpStart_notes.html)
-   [SUNWdhcs DHCPd
    Setup](http://kalali.me/configuring-dhcp-server-in-solaris/)
-   [Sun Packaging Guide](http://www.garex.net/sun/packaging/index.html)
-   [Solaris Event Notification
    API](http://developers.sun.com/solaris/articles/event_completion.html)
-   [Suns OpenBoot PROM reference
    manual](http://delicious.com/redirect?url=http%3A//www.sun.com/products-n-solutions/hardware/docs/html/806-1377-10/index.html)
-   [Solaris IPv6 Administration
    Guide](http://docs.oracle.com/cd/E19683-01/817-0573/)
-   ALOM/iLOM - Get OS Console:

        start /SP/console

    If the console is already in use you can kill it with

        stop /SP/console

-   [ALOM - Set/Get Infos from
    CLI](http://docs.oracle.com/cd/E19102-01/n440.srvr/817-5481-11/sadm_util.html):
    When you want to fetch infos or change settings from a running
    system (e.g. from scripts) you can use the scadm (or rscadm)
    command. Examples:

        # Show log
        scadm loghistory

        # Send a normal or critical console message
        scadm send_event "Important"
        scadm send_event -c "Critical!"

        # Dump all or single settings
        scadm show 
        scadm show sc_customerinfo

-   Dump HW Infos:

        prtconf -v

-   [Cheat Sheet Adding
    Storage](http://unixadminschool.com/blog/2013/07/solaris-storage-configuration-emc-vmax-powerpath-mpxio-vxvm/)
-   [ZFS Cheat Sheet](http://lildude.co.uk/zfs-cheatsheet):

        # Analysis
        zpool list             # List pools
        zpool status -v        # Tree like summary of all disks
        zpool iostat 1         # iostat for all ZFS pools
        zpool history          # Show recent commands

        # Handling properties
        zfs get all z0
        zfs get all z0/data
        zfs set sharenfs=on z0/data
        zfs set sharesmb=on z0/data
        zfs set compression=on z0/data

        # Mounting 
        zfs mount               # List all ZFS mount points
        zfs set mountpoint=/export/data z0/data
        zfs mount /export/data
        zfs unmount /export/data

        # NFS Shares
        zfs set sharenfs=on z1/backup/mydata         # Enable as NFS share
        zfs get sharenfs z1/backup/mydata            # List share options
        zfs sharenfs="<options>" z1/backup/mydata    # Overwrite share options

        # Create and load snapshots
        zfs snapshot z0/data@backup-20120601
        zfs rollback z0/data@backup-20120601

-   Loopback mounting

        lofiadm -a <some file>
        mount -F <fstype> -o ro /dev/lofi/1 /mnt
        umount /mnt
        lofiadm -d /dev/lofi/1

-   OpenSolaris descendants: [OmniOS](http://omnios.omniti.com/),
    [Illumos](https://www.illumos.org/)
-   [PCA](http://www.par.univie.ac.at/solaris/pca/): Patch Checking and
    Installation

