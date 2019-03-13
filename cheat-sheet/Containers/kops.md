## Basic Cluster Handing

AWS commands

    kops <command> --state=s3://<bucket>/<path> <cluster name>
    
    kops create cluster --yes  \
        --zones=us-east-1a \
        --admin-access=<admin IPs> \
        --ssh-access=<admin IPs> \
        --cloud-labels=<labels> \
        --cloud=aws \
        --kubernetes-version v1.13.0 \
        --master-count=3 \
        --name=<cluster name> \
        --networking=calico \
        --node-count=<nr nodes> \
        --state=s3://<bucket>/<path> \
        --topology private
        
    # In the following "[...]" is placeholder for --state and cluster name definitions...
    
    kops validate cluster     [...]
    kops update cluster       [...]
    kops upgrade cluster      [...]
    kops delete cluster --yes [...]

## Resizing

    kops ig edit nodes  [...]       # Edit definition of instance group "nodes"
    kops update cluster [...]

When the size of existing nodes was changed also

    kops rolling-update cluster --yes [...]
