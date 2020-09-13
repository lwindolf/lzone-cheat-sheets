## Useful Examples

Getting to know the system

    wmic bios get Manufacturer,Name,Version
    wmic diskdrive get model,name,size         # physical disks
    wmic logicaldisk get name                  # logical disks
    wmic process list
    wmic process list full
    wmic printer list status
    wmci printerconfig list
    wmic os list brief                         # Windows version incl. serial
    wmic product list brief                    # installed programs  

For interactive mode just run

    wmic

from there use "quit" or "exit" to terminate again.

## Remote Queries

Any query can be performed remote like this
   
    wmic /user:<remote user> /password:<password> /node:<ip or host name> <QUERY COMMAND> <QUERY PARAMS>

## User Management

    wmic group list brief

## Remote Access

    wmic /node:[ip] /user:[user] /password:[password] os list brief
