### Commands

    lxc-ls           # List existing containers

    # Note: all commands take -n  as parameter to specify the container 
    lxc-start        # Start and attach
    lxc-start -d     # Start in background
    lxc-console      # Attach to running container
    lxc-stop

    lxc-clone <source> <target>
    lxc-create -t <template> -f <config file>
    lxc-destroy

    lxc-execute -n <name> -- <command>  # Run command in new container
    lxc-attach  -n <name> -- <command>  # Run command in running container

    lxc-monitor    # Monitor containers for state changes
    lxc-wait       # Wait for a state change
    lxc-info       # Give details on a container

    lxc-freeze
    lxc-unfreeze

    lxc-netstat
    lxc-ps

### Security

-   [Introduction LXC
    Security](https://linuxcontainers.org/lxc/security/)
-   Limit users to LXC bridge. In /etc/lxc/lxc-usernet

        lxcuser1 veth lxcbr0 10

### Misc

-   LXC Config Check

        lxc-checkconfig

-   [LXC Problems with systemd on Debian
    Jessie](https://wiki.debian.org/LXC#Incompatibility_with_systemd)
-   [LXC dnsmasq issue on Debian
    Jessie](https://colinnewell.wordpress.com/2013/12/18/lxc-networking/)
    (bad UDP checksums)

