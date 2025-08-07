Commands to manage swap files

## CLI

    swapon <file>            # Mount unmount swap
    swapoff <file>

    mkswap /dev/xxx          # Create swap file / device
    mkswap --size 8GiB <file>

    free | grep Swap         # Show active/used swap space

## Permanent mount in /etc/fstab

    /swapfile    none    swap    sw    0       0
