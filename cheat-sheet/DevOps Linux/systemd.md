### Commands

    systemctl                   # Lists all units
    systemctl --failed          # List failed
    systemctl status
    systemctl status <unit>
    
    systemctl enable <unit>
    systemctl disable <unit>
    
    systemctl enable --now <unit>  # Enable and start in one go
    systemctl disable --now <unit> # Disable and stop in one go

    systemctl start <unit>
    systemctl stop <unit>

    systemctl mask <unit>
    systemctl unmask <unit>

    systemctl restart <unit>
    systemctl reload <unit>

    systemctl reset-failed [<unit>]

Find unit definitions

    systemctl show <unit>                   # Show configuration
    systemctl show -p FragmentPath <unit>   # Show configuration path

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

### Job Processing

    systemctl list-jobs

### Listing Processes / Containers

To help identify cgroup/process relations run

    ps xawf -eo pid,user,cgroup,args

or

    systemd-cgls

### Performance

Print startup time per service

    systemd-analyze blame

### Logging

Log directory is /var/log/journal

    journalctl                       # Print all log entries
    journalctl -b                    # Print everything since boot
    journalctl -e                    # Print last page of the journal
    journalctl -f                    # Print last 10 entries and continues (like tail -f)
    journalctl -u <unit>             # Print for unit only
    journalctl --no-pager            # Non-interactive mode

    journalctl --disk-usage          # Show space used by logs
    journalctl --rotate              # Force log rotation

    journalctl --vacuum-size=100M    # Remove logs until <100MB is used
    journalctl --vacuum-time=2weeks  # Remove logs older 2 weeks

### DNS

    systemd-resolve --status
    
Config is in /etc/systemd/resolved.conf where might want to make changes like those

    [Resolve]
    DNS=8.8.8.8 8.8.44                # Set explicit nameservers
    Cache=no                          # Disable caching responses

### Other

    hostnamectl
    timedatectl
    localctl
    loginctl

    systemd-detect-virt

### Misc

-   [systemd DBUS API](www.freedesktop.org/wiki/Software/systemd/dbus/)

