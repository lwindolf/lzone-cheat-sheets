
For a thorough description see [this heise.de article](https://www.golem.de/news/visual-studio-code-wie-docker-mit-wsl-2-funktioniert-2011-151327.htm)

## Setup 

Install WSL from CLI

    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

Enable virtualisation support for WSLv2

    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Enforce WSLv2 as default

    wsl --set-default-version 2

## Manage Distros

    wsl -l [-v]                    # List installed distros
    wsl --set-default <name>       # Set default distro
    wsl --set-version <name> 1     # Force distro to run in WSLv1
