#### Optimize VM for SAN I/O

    echo noop > /sys/block/<disk>/queue/scheduler

    # Set a proper max queue length, readahead and max sectors
    echo 1024 > /sys/block/<disk>/queue/nr_requests
    echo 4096 > /sys/block/<disk>/queue/read_ahead_kb
    echo 8192 > /sys/block/<disk>/queue/max_sectors_kb

    # Disable I/O merges
    echo 1 > /sys/block/<disk>/queue/nomerges

    # Disable huge pages
    echo never> /sys/kernel/mm/transparent_hugepage/enabled

    # For single-process workloads
    echo 0 > /sys/block/<disk>/queue/rq_affinity
