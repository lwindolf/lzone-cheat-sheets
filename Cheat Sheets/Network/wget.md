## CLI

    wget -c <url>                # Continue aborted download
    wget -q <url>                # Silent download
    wget -O <file> <url>         # Write to file
    wget -S <url>                # Print server headers
    wget -T <timout> <url>       # Maximum overall timeout
    
    wget --header="Host: abc.com"  ...  # Set headers
    wget --no-check-certificate         # Insecure HTTPS  
