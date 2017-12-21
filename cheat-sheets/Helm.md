See also <?add topic='Openshift'?> <?add topic='kubernetes'?>

## Setup

For instructions check [here](https://docs.helm.sh/using_helm/#quickstart-guide)

    oc login       # Connect to Kubernetes/Openshift
    helm init
    helm repo update
    
    # To get access to unstable charts
    helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/

When running Helm with Kubernetes 1.6.1 (which introduces RBAC) many commands will not work due to missing permissions (see https://stackoverflow.com/questions/43499971/helm-error-no-available-release-name-found)

For Openshift there is an [RBAC compatible installation proceduce](https://blog.openshift.com/getting-started-helm-openshift/).

## List available packages

To list charts (packages)

    helm search

## List installed releases

    helm list

## Install package

    helm install stable/<name> --namespace <ns>     # Install from repo
    helm install ./<file name> --namespace <ns>     # Install from archive

## Misc

- [https://kubeapps.com/]: Web GUI for installing Helm charts
