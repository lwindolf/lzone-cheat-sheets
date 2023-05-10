## Linux CLI

    klist                            # Print ticket cache   
    klist -kte <keytab>              # Get principal name from ktab
    
    kinit -kt  <keytab>              # Get a kerberos ticket
    kinit -p                         # Request proxiable ticket
    kinit -R                         # Renew proxiable ticket
    
    setspn -F -Q */<fqdn>            # Verify if registration was on correct account
    
Check DNS resolving

    dig +short SRV _kerberos._tcp.<fqdn>

## CLI Windows

See also [https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/klist](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/klist)

    klist get <SPN>
    klist purge                      # Purge cache (log off)
    klist sessions                   # logonIDs for sessions
    klist kcd_cache                  # Check constraint delegation
    
    klist query-bind                 # Show binding to KDC
    klist add-bind <name> <fqdn>
    klist purge-bind

## KDC CLI

See [http://www.openkb.info/2014/06/kerberos-cheatsheet.html](http://www.openkb.info/2014/06/kerberos-cheatsheet.html)
