
## CLI

    az login

    az aks get-credentials --resource-group <group name> --name <name>

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
  
- [Pester: Template deployment validation](https://medium.com/charot/test-arm-templates-using-pester-azure-devops-837b5006c30c)
