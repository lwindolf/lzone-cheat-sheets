
## Configure

Set default organization and project

    az devops configure --defaults organization=https://dev.azure.com/MY-ORG project=MyProject

## Login

    az devops login --organization="https://dev.azure.com/MY-ORG"

## Accessing Pipelines

    az pipelines build show --id 1 --open
