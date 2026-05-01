## CLI

    flatpak list

    flatpak install <package>
    flatpak uninstall <package>
    flatpak remove <package>
  
    flatpak uninstall --unused
    
    flatpak run <package>

## Install specific versions

This can only be done by installing by commit hash. So first find out the commit:

 	flatpak remote-info --log flathub <package>
	
Then install by commit:

	flatpak update --commit=<commit> <package>

## Debugging

Enter package environment with a shell:

    flatpak install --include-debug <package>
    flatpak install --include-sdk <package>
    flatpak run --command=sh --devel --filesystem=$(pwd) <package<

In the started shell you can start the flatpak'ed binary with gdb for example.

See also https://docs.flatpak.org/en/latest/debugging.html

## Core Dumps

    flatpak install <myapp>.Debug
    flatpak-coredumpctl <myapp>
