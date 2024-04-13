## md

Commands

    cat /proc/mdstat   # Print status

    mdadm --detail /dev/md0  # Print status per md

    mdadm --manage -r /dev/md0 /dev/sda1 # Remove a disk
    mdadm --zero-superblock /dev/sda1  # Initialize a disk
    mdadm --manage -a /dev/md0 /dev/sda1 # Add a disk

    mdadm --manage --set-faulty /dev/md0 /dev/sda1

Misc

-   [Choosing Superblock Formats](https://utcc.utoronto.ca/~cks/space/blog/linux/SoftwareRaidSuperblockFormats)

## hpacucli

Commands

    # Show status of all arrays on all controllers
    hpacucli all show config
    hpacucli all show config detail

    # Show status of specific controller
    hpacucli ctrl=0 pd all show

    # Show Smart Array status
    hpacucli all show status

    # Create new Array
    hpacucli ctrl slot=0 create type=logicaldrive drives=1I:1:3,1I:1:4 raid=1

## LSI MegaRAID

Commands

    # Get number of controllers
    /opt/MegaRAID/MegaCli/MegaCli64 -adpCount -NoLog

    # Get number of logical drives on controller #0
    /opt/MegaRAID/MegaCli/MegaCli64 -LdGetNum -a0 -NoLog

    # Get info on logical drive #0 on controller #0
    /opt/MegaRAID/MegaCli/MegaCli64 -LdInfo -L0 -a0 -NoLog

## 3Ware

Commands

    tw_cli show
    tw_cli /c0 show
    tw_cli /c0 show drivestatus
    tw_cli /c0 show all
