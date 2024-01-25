---
related:
  cheat-sheet: ['Openshift', 'kubernetes', 'kubectl', 'Helm']
---

## CLI Commands

Note: the `oc` CLI tool is a wrapper around `kubectl`. This page only lists commands
which are `oc` or Openshift specific. All other commands can be found in the [kubectl](kubectl) cheat sheet-

    oc login [<cluster>]
    oc login --username=<user>
    
    oc projects              # List projects
    oc project <project>     # Switch project
    oc new-project <project>
    
    oc whoami -t             # Get current session API token

Creating application from remote repo

    oc new-app https://github.com/name/project
    oc new-app https://github.com/name/project --context-dir=<build dir>
    
For actual builds from a directory. *Careful! If this is a git repo this won't work as the remote git repo will be used!*

    oc new-app --name=<application> .
    oc start-build <application> --from-dir .    # Force build from dir (even if it is a git repo)
    oc start-build <application> -F              # Wait for completion and print full build log
    oc start-build <application> -w              # Wait for completion
    
List available S2I templates

    oc new-app --list

Use specific template

    oc new-app https://github.com/name/project --template=<template>

## Cluster Administration

Removing/Readding nodes

    oc adm drain <node>         # Evacuates all pods with replication controllers
    oc adm uncordon <node>      # Readd node for pod scheduling

### Certificate Management

#### Custom CA bundle

    oc create configmap custom-ca-bundle \
      --from-file=ca-bundle.crt=my_ca_bundle.pem \
      -n openshift-config \
      --dry-run=client -o yaml |
      oc apply -f -

    oc patch proxy/cluster \
      --type=merge \
      --patch='{"spec":{"trustedCA":{"name":"custom-ca-bundle"}}}'

#### Handling application certificates

    # Adding certificate
    oc create secret tls <cert name> --cert=<file> --key=<file> -n openshift-config
    
    # List certs
    oc get secret | grep "kubernetes.io/tls"

#### Rotating cluster certificate

- [Replacing the API server certificate](https://docs.openshift.com/container-platform/4.6/security/certificates/api-server.html)
- [Replacing the default ingress certificate](https://docs.openshift.com/container-platform/4.6/security/certificates/replacing-default-ingress-certificate.html)
  
#### Disaster recovery

[Recover from expired API server certificate](https://docs.openshift.com/container-platform/4.6/backup_and_restore/disaster_recovery/scenario-3-expired-certs.html)
  
Check the API server logs to detect cert errors
  
     oc adm node-logs --role=master --path=openshift-apiserver

### Security Context Constraints (SCC)

    oc get scc                                      # List all SCCs
    oc get scc --as system:admin                    # List SCCs for other account
    
    oc adm policy who-can use scc privileged        # Show who is allowed to use a SCC "privileged"
    
    oc adm policy add-scc-to-user anyuid -z runasanyuid --as system:admin      # Allow a user a new SCC

To determine effective UID range for a namespace

    oc get project -o jsonpath="{.metadata.annotations.openshift\.io/sa\.scc\.uid-range}"

### Print per cluster node resource usage

    oc get nodes --no-headers | awk '{print $1}' | xargs -I {} sh -c 'echo {}; oc describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo'
    
### Creating service accounts

Creating a "root" aka cluster admin service account:

    oc create serviceaccount <name>
    oc adm policy add-cluster-role-to-user cluster-admin -z <name>
    oc sa get-token <name>

## Working with Templates

Create a template from an existing project

    oc export all [-l app=<name>] --as-template my_project >template.yaml
    
Note that the resulting JSON will have no parameters yet. You'll have to 
identify places to replace with parameters (syntax is "${PARAMETER}") and
to declare those parameters.

## Configuring Registries

- https://docs.openshift.com/container-platform/4.4/openshift_images/image-configuration.html (whitelisting/blacklisting external registry domains)
- http://uncontained.io/articles/external-container-registry-integration/ (configuring insecure registries)

## CoreDNS

List effective Corefile

    oc get cm/dns-default -n openshift-dns -o yaml

[Change config](https://rcarrata.com/openshift/dns-forwarding-openshift/) (e.g. add forwarder)

    ( cat <<EOT
    apiVersion: operator.openshift.io/v1
    kind: DNS
    metadata:
      name: default
    spec:
      servers:
      - name: example-dns
        zones:
          - example.com
        forwardPlugin:
          upstreams:
            - 1.2.3.4
     EOT
     ) | oc apply -f -

## Secrets

Configure default pull secret

    oc secrets link default <secret name> --for=pull

## File Transfer

    oc cp <file> <pod>:<path>           # None-recursive copy
    oc rsync <path> <pod>:<path>        # For recursive copy

## Turning off sticky sessions: 

   oc annotate route <name of route> haproxy.router.openshift.io/disable_cookies='true'

