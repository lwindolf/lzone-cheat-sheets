## CLI

    winget search <string>
    winget install <package>
    winget install --id=<package>

## Installation methods

- on self-managed devices install winget via AppInstaller
- on devices you are not admin on [install using Windows Sandbox](https://learn.microsoft.com/en-us/windows/package-manager/winget/#install-winget-on-windows-sandbox)

## Windows Sandbox install

    Install-PackageProvider -Name NuGet -Force | Out-Null
    Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
    Repair-WinGetPackageManager
