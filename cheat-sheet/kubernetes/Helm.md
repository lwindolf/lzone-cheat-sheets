---
related:
  cheat-sheet: ['Helm Templates', 'kubernetes', 'Openshift']
---

Note: this cheat sheet is now Helm3 only

## Setup

For instructions check [here](https://docs.helm.sh/using_helm/#quickstart-guide)

    helm init   
    helm repo update
    helm repo add <repo> <url>

## Setup Docker Registry as Helm Chart Repo

    export HELM_EXPERIMENTAL_OCI=1

## List available packages

To list charts (packages)

    helm search

## List installed releases

    helm ls                           # List releases in current namespace
    helm ls -A                        # List all releases in all namespaces
    
    # Find releases in unexpected state
    helm ls -A -o json | jq  -r '.[] | select(.status = "deployed") | .name'
    
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

## Using Helm in Terraform

Dependency in main.tf

    terraform {
      required_providers {
        helm = {
          version = ">= 3.5"
        }
      }
    }

Declaring Helm ressources with terraform

     resource "helm_release" "myreleasename" {
       name = "myreleasename"
       namespace = "<namespace>"
       create_namespace = <true|false>
       chart = "<path to local chart|chart name>"
     }

## Best Practices

See [Helm Best Practices](/blog/Helm+Best+Practices)

## Misc

- [https://kubeapps.com/](https://kubeapps.com/): Web GUI for installing Helm charts
- Infrastructure as Code solutions for Helm:
   - [helmfile](https://github.com/roboll/helmfile)
   - [Helmsman](https://github.com/Praqma/helmsman)
   - [Terraform](https://github.com/hashicorp/terraform-provider-helm)
- Solutions to host helm charts yourself:
   - chartmuseum
   - harbour
   - Nexus
   - jFrog Artifactory
   - any Docker registry (experimental feature)
