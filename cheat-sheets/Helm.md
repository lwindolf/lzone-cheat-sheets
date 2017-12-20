See also <?add topic='Openshift'?>

## Setup

For instructions check [here](https://docs.helm.sh/using_helm/#quickstart-guide)

    oc login       # Connect to Kubernetes/Openshift
    helm init
    helm repo update

## List available packages

To list charts (packages)

    helm search

## List installed releases

    helm list
