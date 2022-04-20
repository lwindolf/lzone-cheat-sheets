## smbclient Usage

    smbclient -L <server>                    # List shares
    smbclient -L <server> -U <user>%<pwd>    # List shares with auth
    
    smbclient //<server>/<share> -U <user>            # Connect to share interactively
    
    smbclient //<server>/<share> -c <cmd> -U <user>   # Run command on share

### smbclient Commands

The following commands can be passed with `smbclient //<server>/<share> -c`

    ls                      # List files on share
    cd <folder>; ls         # List files on some folder
    
    mkdir <folder>          # Create remote folder
    
    get <remote file name>                    # Download file
    put <local file name> <remote filename>   # Upload file
    rename <remote file> <remote new name>    # Rename file

For a more in-depth cheat sheet: [https://github.com/irgoncalves/smbclient_cheatsheet](https://github.com/irgoncalves/smbclient_cheatsheet)

## Nautilus on !FritzBox NAS

Due to buggy Nautilus (last tested with GNOME 42) only the following works:

1. Install samba-common package to get default `/etc/samba/smb.conf`
2. In `/etc/samba/smb.conf` under `[global]` add 

       client min protocol = NT1

**Important: THIS IS VERY INSECURE!** This configures your system to use the insecure 
and legacy SMBv1 protocol.

