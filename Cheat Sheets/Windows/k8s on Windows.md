Here is a winget based k8s tooling suggestion for Windows:

1. Setup base tooling

       winget install --id=Kubernetes.kubectl
       winget install Microsoft.VisualStudioCode
       winget install Derailed.k9s

3. Setup login support

       winget install --id=in127.kubelogin

4. Install login provider, e.g Entra ID
    
       winget install --id=Microsoft.Azure.Kubelogin
