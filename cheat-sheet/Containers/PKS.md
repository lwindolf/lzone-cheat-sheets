## PKS Commands

     pks login -a <FQDN> -u <user> -p <password> -k
     
     pks plans
     pks network-profiles
     
     pks create-cluster <name> -e <FQDN> -p <plan> -n <node count> --network-profile=<profile>
     
     pks clusters                   # List clusters
     pks cluster <name>             # Monitor cluster     
     pks get-credentials <name>     # Set k8s context

## Bosh Commands

     bosh tasks
