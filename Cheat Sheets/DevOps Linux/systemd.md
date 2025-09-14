## CLI Commands

Handling units

    systemctl start   <unit>
    systemctl stop    <unit>
    systemctl restart <unit>
    
    systemctl enable  <unit>
    systemctl disable <unit>
    systemctl is-enabled <unit>
    
    systemctl mask <unit>
    systemctl unmask <unit>
    
    systemctl edit    <unit>
    
    systemctl --failed                  # Show all failed units (short)
    systemctl --state=failed            # Show all failed units
    
    systemctl reset-failed [<unit>]
    
Change unit definitions with

    systemctl edit <unit>
    systemctl daemon-reload   # after directly modifying/adding config files

Global definitions from /lib/systemd/system will then be overruled by a
new file in /etc/systemd/system

Delete units

    systemctl stop <service>
    systemctl disable <service>
    rm /etc/systemd/system/<servicename>
    systemctl daemon-reload
    systemctl reset-failed
   
Manage targets

    systemctl get-default               # Print currently active target
    systemctl set-default <target>      # Change target
    systemctl list-units --type=target  # Print all units for active target
    
Manage control groups

    systemd-cgls                     # Show all control groups
    
Manage systemd

    systemctl daemon-reload

### Listing Processes / Containers

To help identify cgroup/process relations run

    ps xawf -eo pid,user,cgroup,args

or

    systemd-cgls

### Performance

Print startup time per service

    systemd-analyze blame

## Security

    systemd-analyze security 
    systemd-analyze security <service>

## Logging

    journalctl -xe                   # List recent errors
    journalctl -r                    # List in reverse time order
    
    journalctl -b                    # Show boot log
    journalctl -b -p err             # Show boot errors
    journalctl -k                    # Show kernel messages
    
    journalctl -u <unit>             # List recent log for <unit>
    journalctl -f -u <unit>          # Tail log for <unit>
    
    journalctl --disk-usage          # How many space used by logs
    journalctl --rotate              # Force log rotation
    journalctl --vacuum-time=2d      # Drop all logs older 2 days
    journalctl --vacuum-size=100M    # Drop all logs until only 100MB are used
    journalctl --vacuum-files=3      # Drop all rotations older than 3

## Other systemd tools

    hostnamectl
    timedatectl
    localctl
    loginctl

    systemd-detect-virt


## Misc

-   [systemd DBUS API](www.freedesktop.org/wiki/Software/systemd/dbus/)
