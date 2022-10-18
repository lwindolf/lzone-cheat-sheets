## Debugging

    lpstat -v                    # List known printers
    lpstat -t                    # Show printer status
    
    lpadmin -x <printer>         # Delete printer/destination

## Cups Management
 
    cups-browse -v         # Check printer discovery

    cupsenable <printer name>
    cupsdisable <printer name>
    

## HP plugin installation

To be used with hplip. As user run

    hp-plugin -i
