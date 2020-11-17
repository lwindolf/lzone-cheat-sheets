See also <?add topic='Helm Templates'?> <?add topic='kubernetes'?> <?add topic='Openshift'?> 

Note: this cheat sheet is now Helm3 only

## Setup

For instructions check [here](https://docs.helm.sh/using_helm/#quickstart-guide)

    helm init   
    helm repo update
    
    # To get access to unstable charts
    helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/

For Openshift there is an [RBAC compatible installation proceduce](https://blog.openshift.com/getting-started-helm-openshift/).

## Setup Docker Registry as Helm Chart Repo

    export HELM_EXPERIMENTAL_OCI=1

## List available packages

To list charts (packages)

    helm search

## List installed releases

    helm list                           # List releases in current namespace
    helm list -A                        # List all releases in all namespaces
    helm list -A | grep -v deployed     # Find releases in unexpected state
    helm get values <release>           # Print the values the release was installed with

## Install package

    helm install <name> <chart> [--namespace <ns>]  # Per-default you need to provide a release name
    helm install -g <chart>     [--namespace <ns>]  # Helm 2 like generated release name

## Upgrading releases

    helm upgrade <name>
    helm upgrade --wait <name>                      # Wait for pods to come up

## Working with plugins

    helm plugin list
    helm plugin install <plugin URL>

## Creating chart packages

    helm create mychart                                    # Create boilerplate
    
    helm install mychart-0.1.0.tgz --dry-run --debug       # Test installing

## Best Practices

See [Helm Best Practices](/blog/Helm+Best+Practices)

## Misc

- https://kubeapps.com/: Web GUI for installing Helm charts
- Infrastructure as Code solutions for Helm:
   - [helmfile](https://github.com/roboll/helmfile)
   - [Helmsman](https://github.com/Praqma/helmsman)
   - Terraform
- Solutions to host helm charts yourself:
   - chartmuseum
   - harbour
   - Nexus
   - jFrog Artifactory
