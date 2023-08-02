## Building sources using autotools 

Standard bootstrap: First try maintainer supplied autogen.sh:

    sh autogen.sh

Second try:

    autoreconf -i
    ./configure

## Building Tarballs

    make dist            # .tar.gz
    make dist-bzip2      # .tar.bz2
    make dist-lzma       # .tar.lzma
    make dist-xz         # .tar.xz

    # Extract with
    tar zxf archive.tar.gz
    tar jxf archive.tar.bz2
    tar Jxf archive.tar.lzma
    tar Jxf archive.tar.xz

## Translating

With autotools gettext is the tool of choice...

After changing the sources: Update .pot and all .po files with

    cd po && make update-po

Statistics: Show translation statistics

    for pofile in *.po; do echo -n "$pofile "; msgfmt --statistic $pofile; done

## autotools Installation

On Debian

    apt-get install devscripts build-essential

## Rebuilding from Debian sources

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

## Misc

-   configure - Passing extra CFLAGS, LDFLAGS, ...

        ./configure "CFLAGS=-Wall -Wextra -I/opt/mylib/include" "LDFLAGS=-Lmy"

-   Find out module names for PKG\_CHECK\_MODULES:

        ls /usr/lib/pkg-config
    
-   [Debian Package
    Hardening](https://wiki.debian.org/HardeningWalkthrough) for C/C++
-   [AppData freedesktop.org
    specification](http://www.freedesktop.org/software/appstream/docs/sect-AppStream-Metadata-AppData.html):
    Standard for end user SW description markup.
-   AppData - Validation:

        appdata-validate /usr/share/appdata/myapplication.appdata.xml


