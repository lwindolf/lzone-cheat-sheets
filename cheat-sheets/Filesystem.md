See Also: <?add topic='DRBD'?> <?add topic='LVM'?> <?add topic='Partitioning'?>

### Misc

-   [detox](http://detox.sourceforge.net/): Tool for recursive cleanup
    of file names.

        detox -v -r <directory>

-   [Fast File
    Deletion](http://www.slashroot.in/which-is-the-fastest-method-to-delete-files-in-linux):

        perl -e 'for(<*>){((stat)[9]<(unlink))}'

-   POSIX ACLs:

        getfacl <file>           # List ACLs for file 
        setfacl -m user:joe:rwx dir # Modify ACL
        ls -ld <file>            # Check for active ACL (indicates a "+")

-   [uNetBootin](http://unetbootin.sourceforge.net/): Create bootable
    media for any distribution. Most useful with USB sticks.
-   rsync - --delete doesn't work: It happens when you call rsync
    without a trailing slash in the source path like this:

        rsync -az -e ssh --delete /data server:/data

    It just won't delete anything. It will when running it like this:

        rsync -az -e ssh --delete /data/ server:/data

-   List physical disk serial number

        # As root
        hdparm -I /dev/sda | grep Serial
        lshw -class disk
        smartctl -i /dev/sda
        lsblk --nodeps -o name,serial

        # As user
        /sbin/udevadm info --query=property --name=sda |grep SERIAL

-   inotify - Detect file access

        apt-get install inotify-tools
        inotifywait -m -r /var/log
        inotifywait -m /var/log/auth.log

-   losetup

        losetup /dev/loop0 <disk image>      # Create
        losetup -e /dev/loop0 <disk image>   # Create with encryption
        losetup /dev/loop0          # Get info on loop0
        losetup -d /dev/loop0           # Detach
        losetup -a              # List used loop devices

-   [dm-crypt with/without LUKS](http://cb.vu/unixtoolbox.xhtml#wluks)

#### Automated Sync

Synching without a distributed filesystem

-   [lsyncd](https://code.google.com/p/lsyncd/): inotify based rsync
    daemon

        lsyncd -rsync /home remotehost.org::share/ 

    Or in foreground

        lsyncd -nodaemon -log all -rsyncssh <local dir> <remote host> <remote dir>

#### Distributed Filesystems

Name

Vendor

Distinguishing Features

[Ceph](http://ceph.com)

Inktank Storage

Object store with NFS mounting and S3 API

[DRBD](http://www.drbd.org/)

Linbit

More a replication mechanism

[GlusterFS](http://gluster.org)

Redhat

NFS drop-in

GridFS

[HDFS](http://hadoop.apache.org/)

Hadoop

FUSE mountable

Lustre

Oracle

abandoned, used in HPC

MooseFS

NFS drop-in
