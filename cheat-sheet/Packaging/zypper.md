
## Commands

    zypper install <package> 

    zypper refresh    # Update repository infos

    zypper list-updates
    zypper repos    # List configured repositories

    zypper dist-upgrade   # Upgrade distribution
    zypper dup     # Upgrade distribution (alias)

    zypper search <package>  # Search for <package>
    zypper search --search-descriptions <package>

    zypper clean      # Clean package cache

    # For safe updates:
    zypper mr –keep-packages –remote # Enable caching of packages
    zypper dup -D      # Fetch packages using a dry run
    zypper mr –all –no-refresh  # Set cache usage for following dup
    zypper dup      # Upgrade!
