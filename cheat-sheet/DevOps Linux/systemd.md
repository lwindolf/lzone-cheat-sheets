## CLI Commands

Handling units

    systemctl start   <unit>
    systemctl stop    <unit>
    systemctl restart <unit>
    
    systemctl enable  <unit>
    systemctl disable <unit>
    systemctl is-enabled <unit>
    
    systemctl edit    <unit>
    
    systemctl --state=failed            # Show all failed units
   
Manage targets

    systemctl get-default               # Print currently active target
    systemctl set-default <target>      # Change target
    systemctl list-units --type=target  # Print all units for active target
    
Manage control groups

    systemd-cgls                     # Show all control groups
    
Manage systemd

    systemctl daemon-reload

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
