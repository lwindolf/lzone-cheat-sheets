## Usage examples

    strace <command>         # Trace all syscalls of a command
    strace -f <command>      # Trace including all forked processes
    
    strace -e <syscall>   <command>      # Show only specific syscall(s)
    strace -e open,openat <command>
    
    strace -v -s1000 <command>           # Very verbose shows up to 1000 bytes of parameters
