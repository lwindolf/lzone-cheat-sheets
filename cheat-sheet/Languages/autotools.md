### Building Projects

Standard bootstrap: First try maintainer supplied autogen.sh:

    sh autogen.sh

Second try:

    autoreconf -i
    ./configure

### Installation

On Debian

    apt-get install build-essential

### Misc

-   configure - Passing extra CFLAGS, LDFLAGS, ...

        ./configure "CFLAGS=-Wall -Wextra -I/opt/mylib/include" "LDFLAGS=-Lmy"

-   Find out module names for PKG\_CHECK\_MODULES:

        ls /usr/lib/pkg-config

### Packaging

-   [Build Tarballs with
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

### Translating

With autotools gettext is the tool of choice

-   Update .pot file

        cd po && make update-po

-   Statistics: Show translation statistics

        for pofile in *.po; do echo -n "$pofile "; msgfmt --statistic $pofile; done


