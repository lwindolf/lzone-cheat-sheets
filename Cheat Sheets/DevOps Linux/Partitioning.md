---
related:
  cheat-sheet: [ 'LVM' ]
---

## Disks

Setting/Listing disk UUIDs

    blkid                           # List all
    findfs UUID=<id>                # Find specific id
    ls -l /dev/disk/by-uuid/<id>

    uuidgen                         # New id
    tune2fs -U <id> /dev/sda1       # Setting id

Where to find different partition types

    /dev/disk/by-uuid      -> MBR partitions
    /dev/disk/by-partuuid  -> GPT partitions

## Bootloader

### UEFI Secure Boot

Diagnose with

    efibootmgr -v

### initramfs Update

    update-initramfs -u

###  Grub Config Update

    update-grub

## ext2/ext3/ext4

### Resizing

    resize2fs /dev/sda1 <size>

### [Convert ext2 to ext3](http://www.troubleshooters.com/linux/ext2toext3.htm):

    tune2fs -j /dev/hda1

### [Convert ext3 to ext4](http://www.cyberciti.biz/tips/linux-convert-ext3-to-ext4-file-system.html):

    tune2fs -O extents,uninit_bg,dir_index /dev/sda1

### [Determine Inode Count](http://www.cyberciti.biz/faq/linux-show-contents-of-filesystem-superblock-inode/):

    tune2fs -l /dev/sda1 | grep Inode

### [Disable ext4 barriers](http://liferea.blogspot.de/2010/06/serious-performance-issues-with-ext4fs.html):
    
Add "barrier=0" to the mount options.

