## CLI Usage

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

## Loop on a step

apiVersion: argoproj.io/v1alpha1
kind: Workflow
[...]
spec:
  [...]
  templates:
  - name: loop-example
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
