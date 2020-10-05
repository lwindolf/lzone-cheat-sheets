## Tooling Installation

For Debian

    apt install opensc 
    
## Debugging

Check for card detection: insert card and run

    opensc-explorer

For card reader detection

    opensc-tool -l

For card content (will hex-dump certificates)

    opensc-tool -f

Debug smartcard reader status changes (live updates when adding/removing card)

    pcsc_scan
