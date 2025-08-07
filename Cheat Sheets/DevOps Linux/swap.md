Commands to manage swap files

## CLI

    swapon <file>            # Mount unmount swap
    swapoff <file>

    mkswap /dev/xxx                # Create swap partition
    mkswap -F --size 8GiB <file>   # Create swap file

Show active/used swap space

    free | grep Swap         
    cat /proc/meminfo

For detailed per process swap usage analysis start `top` press `f` and enable 
the `SWAP` column and press `s` to mark it as sort field.

## Permanent mount in /etc/fstab

    /swapfile    none    swap    sw    0       0
