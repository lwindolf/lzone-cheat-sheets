## Usage examples

    strace <command>         # Trace all syscalls of a command
    strace -f <command>      # Trace including all forked processes
    strace -p <pid>          # Attach to a running process
    
    # Filter/set output for specific syscall(s)
    strace -e <output mode>=<syscall set>   <command>
    
    strace -e <syscall set>   <command>
    strace -e open,openat     <command>
    
    strace -v -s1000 <command>           # Very verbose shows up to 1000 bytes of parameters
    strace -x  <command>                 # Print non-ASCII parameters in hex
    
    strace -k -e exit <command>          # Print stacktrace on each 'exit' syscall
    
    strace -t  <command>                 # Add timestamp to each line (resolution: seconds)
    strace -tt <command>                 # Add timestamp to each line (resolution: µseconds)
    strace -T  <command>                 # Print syscall duration for each syscall

To get per syscall time statistics run with

    strace -c <command>

Then you get a summary table like this

    % time     seconds  usecs/call     calls    errors syscall
    ------ ----------- ----------- --------- --------- ----------------
     66,75    0,003708           0      3922           read
     33,25    0,001847           0      2685           write
    ------ ----------- ----------- --------- --------- ----------------
    100,00    0,005555           0      6607           total
