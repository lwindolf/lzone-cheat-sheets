## Commands

    kubectl cluster-info

    kubectl get nodes
    kubectl get pods
    kubectl get rc      # replication controllers

    kubectl get namespaces
    kubectl describe namespaces <ns>

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

## Defining Quotas

    apiVersion: v1
    kind: Template
    objects:
    - apiVersion: v1
      kind: BuildConfig      # or any other...
      spec:
        resources:
          requests:
            cpu: 1
            memory: 2Gi
          limits:
            cpu: 2
            memory: 4Gi

## Migration Stories

- Saltside: https://engineering.saltside.se/migrating-to-kubernetes-day-20-problems-fbbda4905c23

## Use Cases

- [Web Caching with Kubernetes](https://github.com/Financial-Times?utf8=%E2%9C%93&q=varnish)
- [MongoDB Replicas as Stateful Sets in GKE](https://pauldone.blogspot.de/2017/06/deploying-mongodb-on-kubernetes-gke25.html)
