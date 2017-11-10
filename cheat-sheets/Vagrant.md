### CLI Usage

    # Get CLI help with
    vagrant list-commands

    # List boxes and versions
    vagrant box list

    # Setup a new instance
    vagrant box add <name> <box path/HTTP URI>
    vagrant init <name>
    vagrant up
    vagrant halt
    vagrant box remove <name> virtualbox

    vagrant box outdated     # Check for updates
    vagrant box update ...   # Add newest version

    # Login
    vagrant ssh <name>

    # Check status with
    vagrant global-status
