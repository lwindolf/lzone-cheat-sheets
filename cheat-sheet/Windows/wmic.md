{: .highlight }
Note: wmic is being [deprecated in Windows 10 21H1](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/wmic)

## Useful Examples

Getting to know the system

    wmic bios get Manufacturer,Name,Version
    wmic diskdrive get model,name,freespace,size         # physical disks
    wmic logicaldisk get name                            # logical disks
    
    wmic printer list status
    wmci printerconfig list
    wmic os list brief                         # Windows version incl. serial
    wmic product list brief                    # installed programs  
    
    wmic startup list full

For interactive mode just run

    wmic

from there use "quit" or "exit" to terminate again.

## Process Management

List running processes

    wmic process list
    wmic process list brief
    wmic process list brief find "calc.exe"
    wmic process list full

Start and Stop

    wmic process call create "calc.exe"
    wmic process where name="calc.exe" call terminate

And change priority

    wmic process where name="calc.exe" call setpriority 64

Check environment variables

    wmic environment list

## User Management

    wmic group list brief
    wmic useraccount list
    wmic sysaccount list
    
## Updates

    wmic qfe list           # List of missing patches

## Remote Access

Run any command remote, e.g.

    wmic /node:<ip> /user:<user> /password:<password> os list brief

Enable RDP

    wmic /node:<ip> /user:<user> /password:<password> RDToggle where ServerName=<server name> call SetAllowTSConnections 1
