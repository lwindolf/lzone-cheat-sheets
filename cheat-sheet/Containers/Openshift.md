<?add topic='Helm'?>

## Client Setup

    # Follow instructions from GUI setup and download client
    oc login

Settings are stored in ~/.kube/config

## CLI Commands

Note: all Kubernetes commands work with the oc client. So also check <?add topic='Kubernetes'?>

    oc login [<cluster>]
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

## Initial Setup

Commands derived from [jaxenter.com](https://jaxenter.com/manage-container-resource-kubernetes-141977.html) for Openshift:

### Set initial admin pwd

Either use

    oc login -u system:admin

or create credential on master

    sudo htpasswd -b /etc/openshift/openshift-passwd admin <your_pass>

### Print per cluster node resource usage

    oc get nodes --no-headers | awk '{print $1}' | xargs -I {} sh -c 'echo {}; oc describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo'
    
### Creating service accounts

Creating a "root" service account:

    oc create serviceaccount <name>
    oc adm policy add-cluster-role-to-user cluster-admin -z <name>
    oc sa get-token <name>

## Working with Templates

Create a template from an existing project

    oc export all [-l app=<name>] --as-template my_project >template.yaml
    
Note that the resulting JSON will have no parameters yet. You'll have to 
identify places to replace with parameters (syntax is "${PARAMETER}") and
to declare those parameters.

## Orchestration

- [Using Terraform with Openshift](https://medium.com/@fabiojose/platform-as-code-with-openshift-terraform-1da6af7348ce)

## Migrating Services to Openshift

- Middleware
  - [Couchbase](https://blog.couchbase.com/couchbase-on-openshift-in-action/)
  - [Kafka](https://www.nearform.com/blog/benchmarking-apache-kafka-deployed-on-openshift-with-helm/) (using Helm)
- Runtimes
  - [Nodejs](https://github.com/openshift/nodejs-ex.git)
  - [Ruby](https://github.com/openshift/ruby-ex.git)
- Frameworks
  - [Spring Boot Stack](https://access.redhat.com/documentation/en-us/reference_architectures/2017/html-single/spring_boot_microservices_on_red_hat_openshift_container_platform_3/index#software-stack)

## Misc

- Turning off sticky sessions: 

      oc annotate route <name of route> haproxy.router.openshift.io/disable_cookies='true'
    
- [Securing inter-service communication with certificates](https://docs.openshift.com/container-platform/3.6/dev_guide/secrets.html#service-serving-certificate-secrets): done via annotations at the service indicating a TLS cert/key in a secret
    
      apiVersion: v1
        kind: Service
        metadata:
          annotations:
            service.alpha.openshift.io/serving-cert-secret-name: <name>
    
- ebook: [OpenShift for
    Developers](https://www.openshift.com/promotions/for-developers.html)
- OpenShift Cheat Sheets
    -   [http://akrambenaissi.com/2015/11/12/openshift-cheat-sheet-for-beginners/](http://akrambenaissi.com/2015/11/12/openshift-cheat-sheet-for-beginners/)
    -   https://monodot.co.uk/openshift-cheatsheet/
