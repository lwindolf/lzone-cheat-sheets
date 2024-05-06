## CLI Usage

Controlling apps

    argo app list
    argo app get <name>
    argo app get <name> --refresh            # Get with soft refresh
    argo app get <name> --hard-refresh       # Get with hard refresh
    
    argo app diff <name>
    argo app sync <name>
    argo app sync <name> --resource <group>:<kind>:<name>    # Partial sync for one resource
    
    # Change target branch
    argo app patch <name> --patch '[{"op": "replace", "path": "/spec/source/targetRevision", "value": "<new branch name>"}]'

    # Delete app with CLI
    argo app delete-resource <app parent> --group argoproj.io --kind Application --resource-name <app name>

Controlling workflows

    argo list                                # List workflows
    
    argo submit [--watch] myworkflow.yaml    # Create workflow
    argo submit myworkflow.yaml -p foo=bar   # Create workflow with parameters
    argo submit myworkflow.yaml --parameter-file config.yaml
    argo submit myworkflow.yaml --entry-point "my-command"
    
    argo logs <pod>                          # Show workflow log
    argo delete <pod>                        # Delete workflow
    argo delete --all                        # Delete all workflows

You can also use kubectl 

    kubectl get wf             # List workflows
    kubectl delete wf <name>   # Delete workflow

## Simple Workflow

    apiVersion: argoproj.io/v1alpha1
    kind: Workflow                  # new type of k8s spec
    metadata:
      generateName: hello-world-    # name of the workflow spec
    spec:
      entrypoint: whalesay          # invoke the whalesay template
      templates:
      - name: whalesay              # name of the template
        container:
          image: docker/whalesay
          command: [cowsay]
          args: ["{{inputs.parameters.message}}"]
          resources:                # limit the resources
            limits:
              memory: 32Mi
              cpu: 100m

## Multi-Step Workflow

    apiVersion: argoproj.io/v1alpha1
    kind: Workflow
    [...]
    spec:
      [...]
      templates:
      - name: my-template
        steps:
        - - name: step1           # <- Note the list in list structure!
            template: [...]
            arguments:
              parameters: 
                - [...]
        - - name: step2a
            [...]
          - name: step2b
            [...]
        
Execution of the defined steps happens by traversing the list tree. All elements of a tree leaf run in parallel
while the first level list does define the steps sequence. 

## Steps with Loops

    steps:
    - - name: print-message
        template: whalesay
        arguments:
          parameters:
          - name: message
            value: "{{item}}"
        withItems:              # invoke whalesay once for each item in parallel
        - hello world           # item 1
        - goodbye world         # item 2
 
## Steps: Conditional Execution
 
     steps:
        # flip a coin
        - - name: flip-coin
            template: flip-coin
        # evaluate the result in parallel
        - - name: heads
            template: heads                 # call heads template if "heads"
            when: "{{steps.flip-coin.outputs.result}} == heads"
          - name: tails
            template: tails                 # call tails template if "tails"
            when: "{{steps.flip-coin.outputs.result}} == tails"

## Steps: Running scripts

    spec:
      templates:
      - name: flip-coin
        script:
          image: python:alpine3.6
          command: [python]
          source: |
            import random
            result = "heads" if random.randint(0,1) == 0 else "tails"
            print(result)

## Performance

### Server / Repo Server

- When argocd-repo-server or argocd-server are CPU bound provide more CPUs and scale out to multiple replicas
- When sync gets slower and you have many apps set `DEFAULT_REQUEUE_TIME=1m` ([ArgoCD docs](https://argoproj.github.io/argo-workflows/running-at-massive-scale/#overwhelmed-kubernetes-api))

### Application Controller

- When you run in OCP ensure to configure `$HOME` for the application controller pod, it needs to point to `/home/argocd` to be able to cache kubectl contexts in `.kube` ([Github issue](https://github.com/argoproj/argo-cd/issues/8620#issuecomment-1213350358))
- When your application controller is CPU bound and the reconciliation heatmap shows bad performance (>10s)
  - try increasing `ARGOCD_RECONCILIATION_TIMEOUT` to a value larger than the 3min default.
  - define resource exclusion types
  - checkout out the [Reconcile Optimization](https://argo-cd.readthedocs.io/en/stable/operator-manual/reconcile/) instructions to enable and define resource update ignore rules.
  - check if your `ArgoProjects` have a `.spec.orphanedRessources` definition delete it
