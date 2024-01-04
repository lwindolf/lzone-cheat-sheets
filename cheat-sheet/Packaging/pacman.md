See also [Arch Pacman Reference](https://wiki.archlinux.org/title/Pacman)

## CLI

   pacman -S  <package>                    # Install <package>
   pacman -R  <package>                    # Remove  <package>
   pacman -Rn <package>                    # Purge   <package>
   pacman -Rs <package>                    # Remove including orphaned dependencies
   pacman -Qdt                             # List all orphaned packages

   pacman -Sc                              # Clean package cache
   pacman -Syu                             # Update all packages
   
   pacman -Ss <package regex>              # Search for <package regex>
   
   pacman -Si <package>                    # Detailed info on <package>
   
   pacman -Qs <string>                     # Search for installed packages
   pacman -F  <string>                     # Search for files in packages

   pacman -Ql <package>                    # List all files installed by <package>
   pacman -Qo <filename>                   # Check which package installed <filename>
