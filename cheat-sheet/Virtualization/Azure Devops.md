
## Configure

Install CLI extension

    az extension add --name azure-devops

Set default organization and project

    az devops configure --defaults organization=https://dev.azure.com/MY-ORG project=MyProject

## Login

    export AZURE_DEVOPS_EXT_PAT=xxxxxxxxxx         # Provide your access token via env

    az devops login --organization="https://dev.azure.com/MY-ORG"

## Accessing Pipelines

    az pipelines build show --id 1 --open
