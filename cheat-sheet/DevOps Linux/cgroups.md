## CLI

    lsns                # Show all namespaces
    lsns -p <pid>       # Show everything under namespace <pid>
    
    nsenter -t <pid>               # Enter namespace
    nsenter -t <pid> -p -r         # Enter pid namespace (-p) and set root dir (-r)
    nsenter -t <pid> <cmd>         # Run command in namespace

    cgexec -g memory,cpuset:<group name> <command> [<args>]
    
    # Find per process settings
    cat /proc/self/cgroup
    cat /proc/self/uid_map

Limit resources ([source](https://wiki.archlinux.org/title/Cgroups))

    # Create sysfs directory first if necessary
    echo 5000000 > /sys/fs/cgroup/memory/<name>/memory.limit_in_bytes
    
Move process to a cgroup

    echo pid > /sys/fs/cgroup/memory/<name>/cgroup.procs

## Systemd and cgroups

To start something in a user slice

    systemd-run --user --slice=<name>.slice <command> [<args>]

## cgroups version 1 and 2

Determined by kernel parameter (e.g. in your grub config)

    systemd.unified_cgroup_hierarchy=1
    
value 1 means cgroups v2 is enabled. To check on runtime

    grep cgroup /proc/filesystems
    
which should list a "cgroup2" filesystem when v2 is active
