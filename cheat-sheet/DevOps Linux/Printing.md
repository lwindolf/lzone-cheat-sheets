## Debugging

    lpstat -v                    # List known printers
    lpstat -t                    # Show printer status
    lpinfo -v                    # List backends
    
    lpadmin -x <printer>         # Delete printer/destination
    
    avahi-browse -rt _ipp._tcp   # Check wether Avahi sees printer

## Cups Management
 
    cups-browse -v               # Check printer discovery

    cupsenable <printer name>
    cupsdisable <printer name>
    
    cupsctl --debug-logging      # Debug logs on
    cupsctl --no-debug-logging   # Debug logs off
    
    cancel -a -x                 # Drop all jobs from /var/spool/cups

See also [https://wiki.debian.org/CUPSDebugging?action=show&redirect=DissectingandDebuggingtheCUPSPrintingSystem](https://wiki.debian.org/CUPSDebugging?action=show&redirect=DissectingandDebuggingtheCUPSPrintingSystem)

## HP plugin installation

To be used with hplip. As user run

    hp-plugin -i
