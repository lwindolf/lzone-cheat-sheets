### Mounting LVM Partitions

    lvdisplay                   # To lookup partition name
    mount /dev/vg0/vol1 /mnt

### Resizing Volumes

    lvresize -L 50G /dev/volgrp/<name>
    resize2fs /dev/vda
    xfs_growfs /dev/vda

### Adding Disks to Existing Volume

Via: [LVM - Add another
disk](http://sujithemmanuel.blogspot.com/2007/04/how-to-add-disk-to-lvm.html)

    # Setup partition with (use parted for >2TB)
    (parted) mklabel gpt       # only when >2TB
    (parted) mkpart primary lvm 0 4T    # setup disk full size (e.g. 4TB)

    pvcreate /dev/sdb1       # Create physical LVM disk
    vgextend vg01 /dev/sdb1      # Add to volume group
    vgextend -L +4t /dev/mapper/vg01-lvdata  # Extend your volume 
    resize2fs /dev/mapper/vg01-lvdata   # Auto-resize file system
