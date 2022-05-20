## Commands

    apt-get install <package> 
    apt-get remove <package> # Remove files installed by <package>
    apt-get purge <package>  # Remove <package> and all the files it did create

    apt-get upgrade    # Upgrade all packages
    apt-get install <package> # Upgrade an install package

    apt-get dist-upgrade  # Upgrade distribution

    apt-cache search <package> # Check if there is such a package name in the repos
    apt-cache policy <package> # Check which repos in which order provide the package
    apt-cache clean    # Remove all downloaded .debs

    apt-mark showauto   # List all automatically installed packages
    apt-mark showmanual
    apt-mark showhold

## apt file to package lookup

    apt-get install apt-file
    apt-file update
    apt-file search <some file>

## 100% Non-interactive

To achieve a useful 100% non-interactive "apt-get install" you need 4
things:

-   Set Debian frontend "noninteractive"
-   Pass "-y" to confirm everything
-   Specify to keep old configs always
-   Enforce config definitions

Ommitting any of those will cause interaction.

    DEBIAN_FRONTEND=noninteractive apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" <package>

## Unattended Upgrades

    apt-get install unattended-upgrades
    dpkg-reconfigure -plow unattended-upgrades 
    # and maybe set notification mail address in /etc/apt/apt.conf.d/50unattended-upgrades

## Ubuntu Extras

Like Debian with the addition of

    # 1. Edit settings in  /etc/update-manager/release-upgrades
    # e.g. set "Prompt=lts"

    # 2. Run upgrade
    do-release-upgrade -d   # For Ubuntu release upgrades

## Misc

-   Manage Updates on multiple systems: [apt-dater](http://www.ibh.de/apt-dater/)
-   Debian Repo manager [aptly.info](http://aptly.info)
-   APT Repo with [reprepro](http://mirrorer.alioth.debian.org/)

        cd <repo dir>
        reprepro -v includedeb wheezy <.deb file>
        reprepro remove wheezy <name>
