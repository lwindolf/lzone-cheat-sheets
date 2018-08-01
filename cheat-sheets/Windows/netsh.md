## Usage Examples

### Interface Configuration

Static IP

    netsh interface ip set address local static [ip] [netmask] [gw] 1
    
DHCP 

    netsh interface ip set address local dhcp
    
### Firewall

Note "netsh firewall" is deprecated since Vista. Use "netsh advfirewall firewall" instead!

#### Config dumping

    netsh advfirewall firewall export c:\temp\wfas.wfw
    netsh advfirewall firewall import c:\temp\wfas.wfw
    
    netsh advfirewall firewall reset [export  c:\temp\wfas.wfw]
    
#### Toggling states

    netsh advfirewall firewall set [profiletype]state on
    netsh advfirewall firewall set [profiletype]state off
    
#### Changing rules

    netsh advfirewall firewall add rule name="newrule" dir=in action=allow program="%ProgramFiles%\some\program.exe"
    
    netsh advfirewall firewall show rule "newrule" verbose
    
    netsh advfirewall firewall set rule group=”Windows Firewall Remote Management” new enable =yes
