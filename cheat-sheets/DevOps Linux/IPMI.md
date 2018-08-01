### ipmitool Commands

#### [Server side initial setup](http://www.alleft.com/sysadmin/ipmi-sol-inexpensive-remote-console/)

    ipmitool lan set 1 ipsrc static
    ipmitool lan set 1 ipaddr {YOUR DESIRED IP}
    ipmitool lan set 1 netmask {YOUR NETMASK}
    ipmitool lan set 1 auth ADMIN MD5,PASSWORD
    ipmitool lan set 1 arp respond on
    ipmitool lan set 1 access on
    ipmitool user list 1
    ipmitool user set password 2 {YOUR PASSWORD}
    ipmitool lan print 1

#### Hanging BMC

    ipmitool bmc reset cold

#### Change system state

    ipmitool -H <ip> -U <user> chassis power <status|on|off|cycle|reset>

#### Get debug info

    ipmitool lan print

    ipmitool -H <ip> -U <user> shell  # get ipmitool shell, type 'help'
    ipmitool -H <ip> -U <user> sel list   # Show system event log
    ipmitool -H <ip> -U <user> sdr        # List sensor data

#### Get SOL console

    modprobe lanplus    # If not yet loaded

    ipmitool -H <IP> -U <user> -I lanplus sol activate
