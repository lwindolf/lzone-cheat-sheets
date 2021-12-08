runc is the Linux tool you use when you want to spawn containers without Docker/Podman/... 

## CLI

    runc run <name>
    runc run <name> --detach
    
    runc exec <name> <command>         # Run in container
    
    runc list
    
    ls /run/runc
    cat /run/runc/<name>/state.json
    
    runc spec                          # Create spec template in current directory
