See also <?add topic='Openshift'?> <?add topic='kubernetes'?>

## Setup

For instructions check [here](https://docs.helm.sh/using_helm/#quickstart-guide)

    oc login       # Connect to Kubernetes/Openshift
    helm init
    helm repo update
    
    # To get access to unstable charts
    helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/

For Openshift there is an [RBAC compatible installation proceduce](https://blog.openshift.com/getting-started-helm-openshift/).

## List available packages

To list charts (packages)

    helm search

## List installed releases

    helm list

## Install package

    helm install stable/<name> --namespace <ns>     # Install from repo
    helm install ./<file name> --namespace <ns>     # Install from archive

## Creating packages

    helm create mychart                                    # Create boilerplate
    
    helm install mychart-0.1.0.tgz --dry-run --debug       # Test installing

## Misc

- https://kubeapps.com/: Web GUI for installing Helm charts
- https://github.com/Praqma/helmsman: Helmsman, Helm charts as Code, Terraform like plan/apply
