## Basic Cluster Handing

The following example is AWS specific. General syntax is

    kops <command> --state=s3://<bucket>/<path> <cluster name>

To create a cluster in AWS

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

Handle an existing cluster

    # In the following "[...]" is placeholder for --state and cluster name definitions...
    
    kops validate cluster     [...]
    kops update cluster       [...]
    kops upgrade cluster      [...]
    kops delete cluster --yes [...]

Getting infos on the cluster

    kops get clusters
    kops get instancegroups
    kops get secrets <name> -oplaintext
    
    kops get <cluster name> [-o yaml]
    
Set kubecfg cluster context

    kops export kubecfg <cluster name>

## Resizing

    kops ig edit nodes  [...]       # Edit definition of instance group "nodes"
    kops update cluster [...]

When the size of existing nodes was changed also

    kops rolling-update cluster --yes [...]
