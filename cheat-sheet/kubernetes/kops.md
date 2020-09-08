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

## Removing a node

    kubectl drain <node>
    kubectl drain <node> --ignore-daemonsets --delete-local-data         # If needed
    
    kops edit ig nodes     # Set node count to 1 less than before
    
    kubectl delete node <node>
    
    kops update cluster --yes

## Resizing

    kops ig edit nodes  [...]       # Edit definition of instance group "nodes"
    kops update cluster [...]

When the size of existing nodes was changed also

    kops rolling-update cluster --yes [...]

## SSH
SSH is allowed to the masters and the nodes, by default from anywhere.

To change the CIDR allowed to access SSH (and HTTPS), set AdminAccess on the cluster spec.

When using the default images, the SSH username will be admin, and the SSH private key will be the private key corresponding to the public key in kops get secrets --type sshpublickey admin. When creating a new cluster, the SSH public key can be specified with the --ssh-public-key option, and it defaults to ~/.ssh/id_rsa.pub.

Note: In CoreOS, SSH username will be core.

To change the SSH public key on an existing cluster:

kops delete secret --name <clustername> sshpublickey admin
kops create secret --name <clustername> sshpublickey admin -i ~/.ssh/newkey.pub
kops update cluster --yes to reconfigure the auto-scaling groups
kops rolling-update cluster --name <clustername> --yes to immediately roll all the machines so they have the new key (optional)


### Instance Groups
    https://github.com/kubernetes/kops/blob/master/docs/instance_groups.md
