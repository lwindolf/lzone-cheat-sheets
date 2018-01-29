## Useful Examples

Getting to know the system

   wmic bios get Manufacturer,Name,Version    # BIOS info,
   wmic diskdrive get model,name,size         # physical disks,
   wmic logicaldisk get name                  # logical disks,
   wmic process list full                     # processes,
   wmic printer list status                   # printers,
   wmci printerconfig list                    # printer config,
   wmic os list brief                         # Wubdiws version incl. serial
   wmic product list brief                    # installed programs  

For interactive mode just run

   wmic

from there use "quit" or "exit" to terminate again.

## Remote Access

   wmic /node:[ip] /user:[user] /password:[password] os list brief
