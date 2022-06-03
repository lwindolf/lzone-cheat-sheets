### Autotools Packaging

- Setup

        sh autogen.sh
        ./configure

- [Build Tarballs with
    XZ](http://lzone.de/Save+tarball+space+with+make+dist-xz): Build
    different types of tarballs

        make dist            # .tar.gz
        make dist-bzip2      # .tar.bz2
        make dist-lzma       # .tar.lzma
        make dist-xz         # .tar.xz

        # Extract with
        tar zxf archive.tar.gz
        tar jxf archive.tar.bz2
        tar Jxf archive.tar.lzma
        tar Jxf archive.tar.xz

-   Install Debian package build tools

        apt-get install devscripts build-essential

-   Rebuild Debian package (without apt-source)

        mkdir build && cd build
        # Download xxxx.debian.tar.gz from package page
        # Download xxxx.orig.tar.gz from package page (or upstream homepage)
        # Download xxxx.dsc from package page

        # Extract/patch package files
        dpkg-source -x <name>.dsc

        # Install missing deps reported by
        dpkg-checkbuilddeps

        # Build using one of the following
        cd <package source dir>
        debuild -us -uc
        dpkg-buildpackage -us -uc

-   Rebuild Debian package (with apt-source)

        mkdir build && cd build
        apt-get source <name>
        apt-get build-dep <name>

        # And build

-   Patch a Debian package by hand

        # Extract .deb
        dpkg-deb -R <package name> tmp

        # Or if -R switch is not yet available
        dpkg-deb -x <package name> tmp
        dpkg-deb -e <package name> tmp/DEBIAN

        # Rebuild with
        dpkg-deb -b tmp <package name>

-   Debhelper: How to solve when backporting

        dh: Sorry, but 8 is the highest compatibility level supported by this debhelper.

    Change the required version in

        echo 8 >debian/compat

-   [Debian Package
    Hardening](https://wiki.debian.org/HardeningWalkthrough) for C/C++
-   [AppData freedesktop.org
    specification](http://www.freedesktop.org/software/appstream/docs/sect-AppStream-Metadata-AppData.html):
    Standard for end user SW description markup.
-   AppData - Validation:

        appdata-validate /usr/share/appdata/myapplication.appdata.xml


