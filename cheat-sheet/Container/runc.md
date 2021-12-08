runc is the Linux tool you use when you want to spawn containers without Docker/Podman/... 

## CLI

    runc create <name>                 # Create container from current directory
    runc start <name>                  # Start container
    runc delete <name>                 # Remove container
    
    runc run <name>
    runc run <name> --detach
    
    runc exec <name> <command>         # Run in container
    
    runc list
    
    ls /run/runc
    cat /run/runc/<name>/state.json
    
    runc spec                          # Create spec template in current directory
