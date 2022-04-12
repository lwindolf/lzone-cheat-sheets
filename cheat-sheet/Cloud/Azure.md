
## CLI

    az login [--tenant <id>]
    az login --identity               # Login with VM service principal
    
    az account set --subscription <name|id>
    az account list                   # List of subscriptions the account has access to
    az account show                   # To see active subscription
    az account show --output table
    
Note: Always set or verify your subscription as "az login" without tenant chooses one without saying.
    
    az aks get-credentials --resource-group <group name> --name <name>

## Resources / Groups

    az resource list
    az resource list --name <name>
    az resource list -g <resource group>
    
    az group list
    
    az resource show   --name MySubnet --resource-group MyResourceGroup --resource-type "Microsoft.Compute/virtualMachines"
    az resource delete --name MyVm --resource-group MyResourceGroup --resource-type "Microsoft.Compute/virtualMachines"     

## Activity Log

Dump operations needed for creating custom AD roles

    az monitor activity-log list --start-time 2020-09-08 --offset 7d | jq -r '.[] | .operationName["value"] ' | sort -u

## VMs

Get managed identity token via API

    $response = Invoke-WebRequest -Uri 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.azure.com/' -Method GET -Headers @{Metadata="true"}

## AD

    az ad sp list --query "[].appDisplayName"
    az ad sp list --show-mine --query "[].{id:appId, tenant:appOwnerTenantId}"

## ACR

Make an ACR private

    az acr --name <name> --public-network-enabled false

Import docker images into a private ACR (works in Azure Shell)

    az acr import -n MyRegistry --source docker.io/library/hello-world:latest -t targetrepository:targettag

## AKS

    az aks list
    az aks list | jq -r '.[].name'      # Just names
    
    az aks get-credentials --resource-group <resource group> --name <name>      # Get kubectl context
    
    az aks create --name <name> --resource-group <group> --enable-managed-identity [--enable-private-cluster] 

## ARM

- [arm-ttk: Template validation](https://dev.to/omiossec/how-to-test-your-azure-arm-template-with-arm-template-toolkit-arm-ttk-2492)
- ARM What-If Validation
  - https://blog.tyang.org/2020/04/26/validating-arm-templates-with-arm-what-if-operations/
  - https://4bes.nl/2020/06/28/step-by-step-test-and-deploy-arm-templates-with-github-actions/
  
        $Parameters = @{
          ResourcegroupName    = "ARMDeploymentTest"
          Templatefile         = ".\StorageAccount\azuredeploy.json"
          TemplateParameterfile = ".\StorageAccount\azuredeploy.parameters.json"
          Mode                 = 'Incremental'
        }
        $Result = Get-AzResourceGroupDeploymentWhatIfResult @Parameters
        $Result
        
     or
     
        az deployment group what-if -g <group> -f <template file> -p <parameters>
  
- [Pester: Template deployment validation](https://medium.com/charot/test-arm-templates-using-pester-azure-devops-837b5006c30c)

## Keyvaults

    az keyvault secret set --vault-name <vault> --name <secret name> --file <secret file> --encoding ascii --only-show-errors --output none
    az keyvault secret show  --vault-name <vault> --name <secret name>
    az keyvault secret purge --vault-name <vault> --name <secret name>

## Policies

- Microsoft built-in policies: https://github.com/Azure/azure-policy
- Community policies: https://github.com/Azure/Community-Policy
- AKS OpenPolicyAgent gatekeeper enforced policies: https://docs.microsoft.com/de-de/azure/governance/policy/concepts/policy-for-kubernetes
