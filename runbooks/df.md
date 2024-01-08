This runbook is about analyzing disk usage issues.

## Preparation

Determine mount point that is full from

    df -h

Change directory to the mount point

    cd /somepath

## Find largest directories

Increase `-maxdepth` if granularity is insuffcient, but keep it small to get a faster result.

    find . -maxdepth 3 -type d -print0 | xargs -0 -n1 du -sh | sort -hr | head -15

## Find largest files

This can be long running. Try limiting it to the largest directories found
in the step above.

    find . -type f -printf '%k\t%p\n' | sort -nr | head -15

## Check for deleted files using disk space

In case you do not find a cause of the disk being full there might be large files
that were deleted but are still opened by some process. Until the process does not
close their file handles the disk space will not be free. 

To find such files run

    lsof -nP +L1 | sort -nr -k 9 | head -15

Example output with the file size in the 9th column:

    gnome-ter 23634 lars   27u   REG  259,7   131072     0 1581153 /tmp/#1581153 (deleted)
    gnome-ter 23634 lars   26u   REG  259,7  1376256     0 1581144 /tmp/#1581144 (deleted)
    gnome-ter 23634 lars   24u   REG  259,7   458752     0 1580991 /tmp/#1580991 (deleted)
    code       8961 lars   28u   REG  259,7  3252484     0 1577156 /tmp/.org.chromium.Chromium.zZ11HC (deleted)
    gjs        7684 lars   17r   REG  259,7    32768     0  973350 /home/lars/.local/share/gvfs-metadata/home-a1b15d43.log (deleted)
    evolution  7010 lars   13r   REG  259,7    32768     0  973350 /home/lars/.local/share/gvfs-metadata/home-a1b15d43.log (deleted)

Next restart those processes to free the disk space.

## Specific Cleanups

### Systemd Logs

Check systemd log usage with

    journalctl --disk-usage

Drop logs with vacuum to a certain size

    journalctl --vacuum-size=100M

### Package Manager

If the root partition ran full it might temporary help cleaning the package 
manager cache. For Debian-based systems:

     sudo apt clean

## Visualize Disk Usage

To get an overview on disk usage per directory use these visualisations:

- [du Radial Map](https://lzone.de/visual-ops/du+Radial+Map)
- [du Tree Map](https://lzone.de/visual-ops/du+Tree+Map)
