## CLI

    flatpak list

    flatpak install <package>
    flatpak uninstall <package>
    flatpak remove <package>
  
    flatpak uninstall --unused
    
    flatpak run <package>

## Debugging

Enter package environment with a shell:

    flatpak install --include-debug <package>
    flatpak install --include-sdk <package>
    flatpak run --command=sh --devel --filesystem=$(pwd) <package<

In the started shell you can start the flatpak'ed binary with gdb for example.

See also https://docs.flatpak.org/en/latest/debugging.html
