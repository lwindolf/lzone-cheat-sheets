## Container Scheduler Solutions

- Amazon ACS (supports DC/OS, Swarm, Kubernetes)
- CoreOS Fleet
- Cloud Foundry Diego
- Docker Swarm
- Google Container Engine
- kubernetes
- Mesosphere Marathon

See also <?add topic='kubernetes'?>

## Container Source To Image Solutions / CaaS

Integrated Products:
  - Cloud Foundry
  - Openshift

Kubernetes Ecosystem [Cluster Deployment Solutions](https://blog.hasura.io/draft-vs-gitkube-vs-helm-vs-ksonnet-vs-metaparticle-vs-skaffold-f5aa9561f948):
  - Draft
  - Gitkube
  - Helm
  - Ksonnet
  - Metaparticle
  - Skaffold

See also <?add topic='Openshift'?>

## Infrastructure as Code

### Amazon ECS

- [ECS in CloudFormation](https://stelligent.com/2016/05/26/automating-ecs-provisioning-in-cloudformation-part-1/)

### Azure

- [Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/intro-kubernetes)
- [Azure Resource Manager (ARM)](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview)
- [Terraform ARM provider](https://www.terraform.io/docs/providers/azurerm/)

### Kubernetes

See also <?add topic='Helm'?> <?add topic='kubernetes'?>

- [komposer](http://kompose.io/) (Docker Compose for kubernetes and Openshift)
- [kube-applier](https://github.com/box/kube-applier) (single repo watcher, resource files only, no templates)
- Helm (recipe repo manager, upstream chart repo)
- Helmsman (Helm based cluster manager)
- [Armada](http://armada-helm.readthedocs.io/en/latest/readme.html) (Helm based central configuration, including lifecycle hooks)
- [Landscaper](https://github.com/Eneco/landscaper) (Helm charts based resource definition)
- Terraform official kubernetes provider (only a few resource types, missing Deployments/Routes/...)
- Terraform 3rd party kubernetes providers... (FIXME: resource provider)
- [Exekube](https://github.com/exekube/exekube) (projects mapped using terraform+helm)
- [WeaveCloud/flux](https://github.com/weaveworks/flux) (SaaS)
- [Mesosphere Maestro](https://mesosphere.com/blog/announcing-maestro-a-declarative-no-code-approach-to-kubernetes-day-2-operators/) (declarative universal operator)

#### GKE

- [Terraform](https://github.com/hashicorp/terraform-guides/tree/master/infrastructure-as-code/k8s-cluster-gke) official module

### Multi-PaaS IaC Tools

At least supporting Azure, AWS and GCE 

- Terraform
- Ubuntu Juju (also Openstack, Rackspace, vSphere)
