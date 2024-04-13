See also [ZFS Cheat Sheet](https://lildude.co.uk/zfs-cheatsheet)

## Commands

        zpool list             # List pools
        zpool status -v        # Tree like summary of all disks
        zpool iostat 1         # iostat for all ZFS pools
        zpool history          # Show recent commands
        
Handling properties

        zfs get all z0
        zfs get all z0/data
        zfs set sharenfs=on z0/data
        zfs set sharesmb=on z0/data
        zfs set compression=on z0/data
        
Mounting 

        zfs mount               # List all ZFS mount points
        zfs set mountpoint=/export/data z0/data
        zfs mount /export/data
        zfs unmount /export/data
        
NFS Shares

        zfs set sharenfs=on z1/backup/mydata         # Enable as NFS share
        zfs get sharenfs z1/backup/mydata            # List share options
        zfs sharenfs="<options>" z1/backup/mydata    # Overwrite share options
        
Create and load snapshots

        zfs snapshot z0/data@backup-20120601
        zfs rollback z0/data@backup-20120601
