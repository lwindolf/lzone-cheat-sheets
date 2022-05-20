## Commands

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

## Reconfigure after installation

    dpkg-reconfigure -a

## From which repos are those packages?

    apt-cache madison <package>

For example to find out which packages are not from the debian repos:

    for i in $(dpkg -l | awk '{print $2}'); do apt-cache madison $i; done |grep -v debian.org

## File Diversion

    # Register diverted path and move away
    dpkg-divert --add --rename --divert <renamed file path> &file path>

    # Remove a diversion again (remove file first!)
    dpkg-divert --rename --remove <file path>

## Add another architecture

    dpkg --add-architecture i386
