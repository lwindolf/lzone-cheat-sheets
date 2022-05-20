## apt Commands

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
