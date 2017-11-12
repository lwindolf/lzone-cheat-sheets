### Commands

    kubectl cluster-info

    kubectl get nodes
    kubectl get pods
    kubectl get rc      # replication controllers

    kubectl get services
    kubectl describe services <service>

    kubectl get deployments <application>
    kubectl describe deployments <application>

    kubectl get replicasets
    kubectl describe replicasets

    kubectl create -f some.json

    kubectl get rc <node> -o yaml >some.yaml
    kubectl uptate -f some.yaml

    kubectl delete pod -l name=<name>
    kubectl delete services &lt;service>
    kubectl delete deployment &lt;application>

    kubectl run-container <name> --image=<image> --port=<port>

    kubectl resize --replicas=4 rc <name>

    kubectl expose rc <name> --port=<port> --public-ip=<ip>

### Migration Stories

- Saltside: https://engineering.saltside.se/migrating-to-kubernetes-day-20-problems-fbbda4905c23

### Misc

-   ebook: [OpenShift for
    Developers](https://www.openshift.com/promotions/for-developers.html)
-   OpenShift Cheat Sheets
    -   [http://akrambenaissi.com/2015/11/12/openshift-cheat-sheet-for-beginners/](http://akrambenaissi.com/2015/11/12/openshift-cheat-sheet-for-beginners/)
    -   https://monodot.co.uk/openshift-cheatsheet/

