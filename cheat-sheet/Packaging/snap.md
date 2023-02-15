## Commands

    snap version

    snap list              # List installed
    snap list --all        # List including all revisions
    
    snap find <string>     # Find available snaps by name
    snap info <name>       # Print details
    
    snap install <name>
    snap remove  <name>
    snap remove --purge <name>   # Remove without creating a snapshot
    
    snap refresh <name>    # Update snap
    snap revert  <name>    # Revert to previous version
    
    snap disable <name>
    snap enable  <name>

## Channels

    snap install --channel=edge <name>         # Install from another channel
    snap switch --channel=stable <name>        # Switch to another channel

## Confinement

Check confinement with

    snap connections <name>

If a `home` interface is listed. The snap will have a home dir in `~/snap/<name>`

## Snapshots

Snapshots might be created automatically or are create when removing snaps.

    snap saved          # List snapshots
    snap save           # New snapshot for all installed snaps
    snap restore <id>   # Restore a snapshot
    snap forget <id>    # Delete a snapshot
    
    snap check-snapshot <id>               # Verify snapshot
    snap export-snapshot <id> <filename>   # Export as tarball to given filename
    snap import-snapshot <tarball>
    
    snap set system snapshots.automatic.retention=12d      # Set snapshot retention
    
    
For details: [https://snapcraft.io/docs/snapshots](https://snapcraft.io/docs/snapshots)

## Gettting rid of snap in Ubuntu 20.x/22.x

    snap list                # To see all packages
    snap remove <packages>   # Remove all packages except "core*" and "bare"
    rm -rf /var/cache/snapd
    apt autoremove --purge snapd
    
