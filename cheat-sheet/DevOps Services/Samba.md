## CLI

    samba-tool domain trust list
    samba-tool domain trust show <name>
    samba-tool domain trust validate <name> -U<user>
    
    wbinfo --all-domains
    wbinfo --own-domain
    wbinfo --trusted-domains

    wbinfo -n <urn>         # Show sid and object type for URN
    wbinfo -m               # Check connectivity
    wbinfo --online-status
    wbinfo --ping-dc [--domain=<domain>]

    
    samba-tool user list -H ldap://<domain> -U <user>
    
    wbinfo -i <urn>   # List user
    wbinfo -a <urn>   # Authenticate
    
    
    
    wbinfo --name-to-sid <urn>
    
    samba-tool group listmembers <group>
    samba-tool group addmembers <group> <sid>
   
     
