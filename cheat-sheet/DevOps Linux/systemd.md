## CLI Commands

    systemctl start   <unit>
    systemctl stop    <unit>
    systemctl restart <unit>
    systemctl edit    <unit>

## Logging

    journalctl -xe              # List recent errors
    journalctl -r               # List in reverse time order
    journalctl -u <unit>        # List recent log for <unit>
    journalctl -f -u <unit>     # Tail log for <unit>
    
    journalctl --disk-usage          # How many space used by logs
    journalctl --rotate              # Force log rotation
    journalctl --vacuum-time=2d      # Drop all logs older 2 days
    journalctl --vacuum-size=100M    # Drop all logs until only 100MB are used
    journalctl --vacuum-files=3      # Drop all rotations older than 3
