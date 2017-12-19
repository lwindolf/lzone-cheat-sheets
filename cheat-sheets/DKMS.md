## Commands

List managed DKMS modules

    dkms status
    
List installed DKMS Debian packages

    dpkg -l "*-dkms"

## Build DKMS module from git source

Prepare sources:

    git clone &lt;some repo> src
    cd src
    NAME=&lt;module name>
    VERSION=&lt;module version>
    mkdir /usr/src/${NAME}-${VERSION}
    git archive driver-${VERSION} | tar -x -C /usr/src/${NAME}-${VERSION}

And build using DKMS

    dkms add     -m ${NAME} -v ${VERSION}
    dkms build   -m ${NAME} -v ${VERSION}
    dkms install -m ${NAME} -v ${VERSION}

Finally check if "dkms status" lists the module with state "installed" for your kernel version

## Uninstalling

    dkms remove &lt;module name>/&lt;module version> --all
