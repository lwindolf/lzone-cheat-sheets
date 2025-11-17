## CLI

    # Manage domain level
    samba-tool domain level show
    samba-tool domain level raise --forest-level=2003 --domain-level=2003

    # Check and fix AD DB
    samba-tool dbcheck --fix --yes
    
    samba-tool domain trust list
    samba-tool domain trust show <name>
    samba-tool domain trust validate <name> -U<user>
    samba-tool domain trust create <options>

    # Check trust with
    wbinfo --ping-dc –domain=<domain>  
    wbinfo --check-secret –domain=<domain>

    # List domains
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
   
     
