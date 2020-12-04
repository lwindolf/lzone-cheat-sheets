---
related:
  cheat-sheet: ['Package Management']
---

## Debian

-   Check for security upgrades

        # With apt-show-versions
        apt-show-versions | grep "security upgradeable"

        # With aptitude
        aptitude search '?and(~U,~Asecurity)'

        # With pure apt-get
        grep -h '^deb.*security' /etc/apt/sources.list /etc/apt/sources.list.d/* >sec.list
        apt-get -s dist-upgrade -o Dir::Etc::SourceList=sec.list | grep ^Inst

-   Check for restarts on library upgrades

        apt-get install needrestart

        needrestart

-   [Build Kernel
    Package](http://delicious.com/redirect?url=http%3A//tldp.org/HOWTO/Wireless-Link-sys-WPC11/x295.html):
    How to build kernel packages with make-pkg

        cd /usr/src/linux && make-kpkg clean && make-kpkg --initrd --revision=myrev kernel_image

-   [Setup
    Keyring](http://changelog.complete.org/archives/496-how-to-solve-the-following-packages-cannot-be-authenticated):
    How to solve "The following packages cannot be authenticated"

        apt-get install debian-archive-keyring
        apt-get update

-   [Security Debian
    HowTo](https://www.debian.org/doc/manuals/securing-debian-howto/ch4.de.html)

### Upgrades

-   Upgrade wheezy -\> jessie

        apt-get update
        apt-get upgrade

        sed -i 's/wheezy/jessie/g' /etc/apt/sources.list /etc/apt/sources.list.d/*

        apt-get update
        apt-get upgrade
        apt-get dist-upgrade
        reboot

-   Upgrade squeeze -\> wheezy

        apt-get update
        apt-get upgrade

        sed -i 's/squeeze/wheezy/g' /etc/apt/sources.list /etc/apt/sources.list.d/*

        apt-get update
        apt-get install apt dpkg aptitude
        apt-get dist-upgrade
        reboot

-   [Force remove broken
    "reportbug"](http://forums.debian.net/viewtopic.php?f=17&t=40109):
    This can happen during dist-upgrades from Etch/Sarge to Lenny.

### Snapshots

You can access arbitrary older releases via
[snapshot.debian.org](http://snapshot.debian.org/):

    deb     http://snapshot.debian.org/archive/debian/20091004T111800Z/ lenny main
    deb-src http://snapshot.debian.org/archive/debian/20091004T111800Z/ lenny main
    deb     http://snapshot.debian.org/archive/debian-security/20091004T121501Z/ lenny/updates main
    deb-src http://snapshot.debian.org/archive/debian-security/20091004T121501Z/ lenny/updates main

## APT Cheat sheet
        https://blog.packagecloud.io/eng/2015/03/30/apt-cheat-sheet/

## Ubuntu

-   Ubuntu - Access Repositories for older releases. Once a release is
    deprecated it is moved to old-releases.ubuntu.com. You need to adapt
    /etc/apt/sources.list to fetch packages from there

        sed -i 's/archive.ubuntu.com/old-releases.ubuntu.com/' /etc/apt/sources.list

-   Ubuntu - Check for new HWE

        hwe-support-status

-   Ubuntu - List Security Updates

        # Print summary
        /usr/lib/update-notifier/apt-check --human-readable

        # Print package names
        /usr/lib/update-notifier/apt-check -p

-   Ubuntu - Upgrade Security Fixes Only

        apt-get dist-upgrade -o Dir::Etc::SourceList=/etc/apt/sources.security.repos.only.list

-   Ubuntu - Reboot Required

        ls /var/run/reboot-required # Reboot flag file

        # Packages requiring the reboot
        cat /var/run/reboot-required.pkgs


