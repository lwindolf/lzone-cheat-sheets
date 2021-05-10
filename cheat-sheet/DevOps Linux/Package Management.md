---
related:
   cheat-sheet: ['Packaging']
---

### Debian

#### apt Commands

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

##### File to Package lookup

    apt-get install apt-file
    apt-file update
    apt-file search <some file>

##### Install only Debian Security Updates

Tested with Squeeze, Wheezy, Jessie:

    grep -h '^deb.*security' /etc/apt/sources.list /etc/apt/sources.list.d/* >/tmp/b && \
    apt-get dist-upgrade -o Dir::Etc::SourceList=/tmp/b -o Dir::Etc::sourceparts=/nonexistingdir && \
    rm /tmp/b

##### 100% Non-interactive

To achieve a useful 100% non-interactive "apt-get install" you need 4
things:

-   Set Debian frontend "noninteractive"
-   Pass "-y" to confirm everything
-   Specify to keep old configs always
-   Enforce config definitions

Ommitting any of those will cause interaction.

    DEBIAN_FRONTEND=noninteractive apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" <package>

#### dpkg Commands

    dpkg -i <package file>             # Install
    dpkg -P <package name>             # Uninstall
   
    dpkg -C                            # find all package with broken files
    dpkg -l | awk '/^iF/ {print $2}'   # find partially installed packages

    # Resolve file to package
    dpkg -S /etc/fstab

    # Print all files of a package
    dpkg -L passwd # provided files
    dpkg -c passwd # owned files

    # Find packages by name
    dpkg -l gnome*

    # Package details
    dpkg -p passwd

**Reconfigure after installation:**

    dpkg-reconfigure -a

**From which repos are those packages?**

    apt-cache madison <package>

For example to find out which packages are not from the debian repos:

    for i in $(dpkg -l | awk '{print $2}'); do apt-cache madison $i; done |grep -v debian.org

**File Diversion:**

    # Register diverted path and move away
    dpkg-divert --add --rename --divert <renamed file path> &file path>

    # Remove a diversion again (remove file first!)
    dpkg-divert --rename --remove <file path>

**Add another architecture**

    dpkg --add-architecture i386

#### Unattended Upgrades

    apt-get install unattended-upgrades
    dpkg-reconfigure -plow unattended-upgrades 
    # and maybe set notification mail address in /etc/apt/apt.conf.d/50unattended-upgrades

#### Misc

-   Manage Updates on multiple systems:
    [apt-dater](http://www.ibh.de/apt-dater/)
-   Debian Repo manager [aptly.info](http://aptly.info)
-   APT Repo with [reprepro](http://mirrorer.alioth.debian.org/)

        cd <repo dir>
        reprepro -v includedeb wheezy <.deb file>
        reprepro remove wheezy <name>

### Ubuntu

Like Debian with the addition of

    # 1. Edit settings in  /etc/update-manager/release-upgrades
    # e.g. set "Prompt=lts"

    # 2. Run upgrade
    do-release-upgrade -d   # For Ubuntu release upgrades

### OpenSuSE

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

### Redhat

    up2date

### CentOS

    yum update     # Upgrade distro
    yum install <package>  # Install <package>
