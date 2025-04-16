
## Configure

Install CLI extension

    az extension add --name azure-devops

Set default organization and project

    az devops configure --defaults organization=https://dev.azure.com/MY-ORG project=MyProject
    
## Login

    export AZURE_DEVOPS_EXT_PAT=xxxxxxxxxx         # Provide your access token via env

    az devops login --organization="https://dev.azure.com/MY-ORG"

## Working with Azure Devops Pipelines

### Syntax

Working with variables

    $(myvar)            # normal variable value replacement
    ${{myparam}}        # compile time expression (good for parameters, constant calculation)
    $[variables.myvar]  # runtime expression (good to dynamically calculate/check stuff)
    
Expression examples

    ${{ myparam != '' }}
    $[ ne(result, 0) ]
    $[ eq(variables['Build.SourceBranch'], 'refs/heads/master') ]

### Accessing Pipelines

    az pipelines run --name <pipeline name> [--branch <branch>]
    az pipelines run --name <pipeline name> | jq .id         # Start pipeline and get build id
      
    # Get result status of a pipeline
    az pipelines runs show --id "$1" 2>/dev/null | jq -r .result
    
    # Tag a pipeline build
    az pipelines runs tag add --run-id <id> --tags "mytag"
    
    az pipelines build show --id <id> --open

### Managing Service Endpoints

    az devops service-endpoint list
    
### Running Pipeline periodically

By using a cron declaration you can run pipelines

    - cron: "0 0 * * *"
      displayName: my nightly build
      branches:
        include:
          -master
      always: true

Note: `always: true` is needed, when you want to run the pipeline every time
even when there are no git changes.

### Selecting checkout branch by variable/parameter

It is not possible to select the checkout branch dynamically (static definition works)
in the resources section. There is a workaround by using explicit "checkout" steps in
the pipeline which allow specifying branches

    - checkout: git://MyProject/MyRepo@features/tools # checks out the features/tools branch
    - checkout: git://MyProject/MyRepo@refs/heads/features/tools # also checks out the features/tools branch
    - checkout: git://MyProject/MyRepo@refs/tags/MyTag # checks out the commit referenced by MyTag.

Note though that this will not allow to modify YAML based variable definitions, as they
are executed long before this step!

## Setup Private Build Agents

E.g. with Terraform and ACI https://github.com/Azure/terraform-azurerm-aci-devops-agent
