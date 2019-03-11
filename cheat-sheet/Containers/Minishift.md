## CLI

    minishift start
    minishift stop
    
    minishift addons list
    minishift addons enable <name>
    
## Install admin user addon

    minishift addons install --defaults
    minishift addons enable admin-user
    minishift start
    
## Cluster admin

Log in with

    oc login -u system:admin
