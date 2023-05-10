## CLI

    klist                            # Print ticket cache
    klist get <SPN>
    
    klist -kte <keytab>              # Get principal name from ktab
    
    kinit -kt  <keytab>              # Get a kerberos ticket
    
    setspn -F -Q */<fqdn>            # Verify if registration was on correct account
    
Check DNS resolving

    dig +short SRV _kerberos._tcp.<fqdn>
