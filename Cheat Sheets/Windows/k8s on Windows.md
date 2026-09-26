Here is a winget based k8s tooling suggestion for Windows:

1. Setup base tooling

       winget install --id=Kubernetes.kubectl
       winget install --id=Microsoft.VisualStudioCode
       winget install --id=Derailed.k9s
       winget install --id=Git.Git

3. Setup login support

       winget install --id=in127.kubelogin

4. Install login provider, e.g Entra ID
    
       winget install --id=Microsoft.Azure.Kubelogin
