## Container Scheduler Solutions

- Amazon ACS (supports DC/OS, Swarm, Kubernetes)
- CoreOS Fleet
- Cloud Foundry Diego
- Docker Swarm
- Google Container Engine
- kubernetes
- Mesosphere Marathon

See also <?add topic='kubernetes'?>

## Container Source To Image Solutions

- Cloud Foundry
- Openshift

See also <?add topic='Openshift'?>

## Infrastructure as Code

### Amazon ECS

- [ECS in CloudFormation](https://stelligent.com/2016/05/26/automating-ecs-provisioning-in-cloudformation-part-1/)

### Azure

- [Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/intro-kubernetes)
- [Azure Resource Manager (ARM)](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview)
- [Terraform ARM provider](https://www.terraform.io/docs/providers/azurerm/)

### Kubernetes

- [kube-applier](https://github.com/box/kube-applier) (single repo watcher, resource files only, no templates)
- Helm (recipe repo manager, upstream chart repo)
- Helmsman (Helm based cluster manager)
- Terraform official kubernetes provider (only a few resource types, missing Deployments/Routes/...)
- Terraform 3rd party kubernetes providers... (FIXME: resource provider)
- [Exekube](https://github.com/exekube/exekube) (projects mapped using terraform+helm)
- [WeaveCloud/flux](https://github.com/weaveworks/flux) (SaaS)

#### GKE

- [Terraform](https://github.com/hashicorp/terraform-guides/tree/master/infrastructure-as-code/k8s-cluster-gke) official module


See also <?add topic='Helm'?> <?add topic='kubernetes'?>
