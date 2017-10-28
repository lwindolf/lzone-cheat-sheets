### Commands

    vzlist                               # List running instances
    vzlist -a                            # List all instances

    vzctl stop <instance>
    vzctl start <instance>
    vzctl status <instance>

    vzctl exec <instance> <command>      # Run a command

    vzctl enter <instance>               # Get console

    vzyum <instance> install <package>   # Install a package


    # Change properties
    vzctl set <instance> --hostname <hostname> --save
    vzctl set <instance> --ipadd <IP> --save
    vzctl set <instance> --userpasswd root:<password> --save
