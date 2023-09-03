## CLI Usage

### perf top

Allows you to monitor processes

    perf top             # Shows incomplete details!!!
    perf top -a          # Shows usage per symbol on all CPUs
    perf top -a -g       # Shows usage with call-graphs on everything
    
    perf top -a -ns comm,dso    # Show usage per process+symbol tuples

### perf stat

Allows you to monitor breakpoints

    perf list            # Print list of supported event types
    
    perf stat -a sleep 5                            # Overview over everything
    perf stat -e syscalls:* -a <cmd>                # Overview over all system calls
    perf stat -e ext4:ext4_request_inode -a <cmd>   # Counter for a single ext4 metric

### perf record

Creating perf trace files

     perf record -F 99 -a -g -- sleep 60
     perf script > out.perf

Afterwards post-processing into collapsed stacks and flame graphs is possible: see [https://github.com/brendangregg/FlameGraph](https://github.com/brendangregg/FlameGraph).
