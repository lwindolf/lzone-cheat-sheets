## Commands

    apt-get install <package> 
    apt-get remove <package>     # Remove files installed by <package>
    apt-get purge <package>      # Remove <package> and all the files it did create

    apt-get upgrade              # Upgrade all packages
    apt-get install <package>    # Upgrade an already installed package

    apt-get dist-upgrade         # Upgrade distribution

    apt-cache search <package>   # Check if there is such a package name in the repos
    apt-cache policy <package>   # Check which repos in which order provide the package
    apt-cache clean              # Remove all downloaded .debs

    apt-mark showauto            # List all automatically installed packages
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

## Using Snapshots

You can access arbitrary older releases via [snapshot.debian.org](http://snapshot.debian.org/):

    deb     http://snapshot.debian.org/archive/debian/20091004T111800Z/ lenny main
    deb-src http://snapshot.debian.org/archive/debian/20091004T111800Z/ lenny main
    deb     http://snapshot.debian.org/archive/debian-security/20091004T121501Z/ lenny/updates main
    deb-src http://snapshot.debian.org/archive/debian-security/20091004T121501Z/ lenny/updates main

## APT Proxy Auth

Create an new auth.conf entry in `/etc/apt/auth.conf.d/myproxy.conf`

    machine <host/path> login <user> password <password>

## Unattended Upgrades

    apt-get install unattended-upgrades
    dpkg-reconfigure -plow unattended-upgrades 
    # and maybe set notification mail address in /etc/apt/apt.conf.d/50unattended-upgrades

## Check for security upgrades

- Debian

      # With apt-show-versions
      apt-show-versions | grep "security upgradeable"

      # With aptitude
      aptitude search '?and(~U,~Asecurity)'

      # With pure apt-get
      grep -h '^deb.*security' /etc/apt/sources.list /etc/apt/sources.list.d/* >sec.list
      apt-get -s dist-upgrade -o Dir::Etc::SourceList=sec.list | grep ^Inst
        
- Ubuntu 

      # Print summary
      /usr/lib/update-notifier/apt-check --human-readable

      # Print package names
      /usr/lib/update-notifier/apt-check -p

## Check for necessary restarts

    apt-get install needrestart
    needrestart

## Ubuntu differences

### Distro upgrades

Run upgrade with

    do-release-upgrade [-d]       # use -d when you want all versions

You can configure prompting for versions by changing `Prompt=lts` in `/etc/update-manager/release-upgrades`

### Snapshots

Access Repositories for older releases. Once a release is deprecated it is moved to old-releases.ubuntu.com. You need to adapt `/etc/apt/sources.list` to fetch packages from there

    sed -i 's/archive.ubuntu.com/old-releases.ubuntu.com/' /etc/apt/sources.list

### Check for new HWE

    hwe-support-status

### Upgrade Security Fixes Only

    apt-get dist-upgrade -o Dir::Etc::SourceList=/etc/apt/sources.security.repos.only.list

### Check if  Reboot Required

    ls /var/run/reboot-required # Reboot flag file

    # Packages requiring the reboot
    cat /var/run/reboot-required.pkgs

## Misc

-   Manage Updates on multiple systems: [apt-dater](http://www.ibh.de/apt-dater/)
-   Debian Repo manager [aptly.info](http://aptly.info)
-   APT Repo with [reprepro](http://mirrorer.alioth.debian.org/)

        cd <repo dir>
        reprepro -v includedeb wheezy <.deb file>
        reprepro remove wheezy <name>

- [Build Kernel Package](http://delicious.com/redirect?url=http%3A//tldp.org/HOWTO/Wireless-Link-sys-WPC11/x295.html): How to build kernel packages with make-pkg

      cd /usr/src/linux && make-kpkg clean && make-kpkg --initrd --revision=myrev kernel_image

- [Setup Keyring](http://changelog.complete.org/archives/496-how-to-solve-the-following-packages-cannot-be-authenticated): How to solve "The following packages cannot be authenticated"

      apt-get install debian-archive-keyring
      apt-get update

- [Security Debian HowTo](https://www.debian.org/doc/manuals/securing-debian-howto/ch4.de.html)
