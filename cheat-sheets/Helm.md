See also <?add topic='Openshift'?>

## Setup

For instructions check [here](https://docs.helm.sh/using_helm/#quickstart-guide)

    oc login       # Connect to Kubernetes/Openshift
    helm init
    helm repo update

When running Helm with Kubernetes 1.6.1 (which introduces RBAC) many commands will not work due to missing permissions (see https://stackoverflow.com/questions/43499971/helm-error-no-available-release-name-found)

## List available packages

To list charts (packages)

    helm search

## List installed releases

    helm list
