## Linux CLI

    klist                            # Print ticket cache   
    klist -kte <keytab>              # Get principal name from ktab
    
    kinit -kt  <keytab>              # Get a kerberos ticket
    kinit -p                         # Request proxiable ticket
    kinit -R                         # Renew proxiable ticket
    
    KRB5_TRACE=/dev/stdout kinit [...]      # Detailed trace of ticket requesting
    
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

## More Documentation

- [KDC CLI Cheatsheet](http://www.openkb.info/2014/06/kerberos-cheatsheet.html)
- [NetBIOS Name Syntax](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-nbte/6f06fa0e-1dc4-4c41-accb-355aaf20546d)
- [SPNs for web applications](https://techcommunity.microsoft.com/t5/iis-support-blog/how-to-use-spns-when-you-configure-web-applications-that-are/ba-p/324648)
- [Kerberos SPN](https://www.msxfaq.de/windows/kerberos/kerberosspn.htm) (German)
- [Kerberos AES256 Encryption](https://www.msxfaq.de/windows/kerberos/kerberos_encryption.htm) (German)
