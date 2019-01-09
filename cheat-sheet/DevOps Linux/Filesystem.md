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
        
        inotifywait -m -r /var/log           # Show all activity in all subdirs
        inotifywait -m -e create -r /data    # Show all file/dir creations
        inotifywait -m -e isdir -r /data     # Show all subdir accesses (e.g. before mkdir)
        
        inotifywait -m /var/log/auth.log     # Show all access to single file

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

| Name | Vendor | Distinguishing Features |
| ---- | ------ | ----------------------- |
| [HDFS](http://hadoop.apache.org/) | Hadoop | FUSE, NFS, HFTP, S3 |
| [Ceph](http://ceph.com) | Redhat | NFS, POSIX, S3, Swift, Fuse, Docker support |
| [GlusterFS](http://gluster.org) | Redhat | NFS, POSIX, S3, Docker support, also as "Redhat Storage Server" |
| [OCFS2](https://oss.oracle.com/projects/ocfs2/) | Oracle | POSIX, often used with [DRBD](http://www.drbd.org/)  Block replication |
| [Lustre](http://lustre.org/) | Oracle | POSIX, abandoned, used in HPC |
| [MooseFS](https://moosefs.com/) | Core Technology | POSIX, NFS drop-in |

Cloud/SaaS


| Name | Vendor | Distinguishing Features |
| ---- | ------ | ----------------------- |
| Elastifile ECFS |    | Google Cloud, AWS, Azure |
| Nooba | Redhat | End-user easy cluster on any cloud storage |
| Azure Netapp Files |   | Azure, Google Cloud |
