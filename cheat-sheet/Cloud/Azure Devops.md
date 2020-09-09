
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

    az pipelines build show --id 1 --open

### Managing Service Endpoints

    az devops service-endpoint list
