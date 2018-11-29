## Commands

    kubectl cluster-info

    # In general query resource typs with
    #
    # kubectl get <type>
    # kubectl describe namespaces <ns>
    
    kubectl get nodes
    kubectl get pods
    kubectl get rc                     # replication controllers
    kubectl get namespaces
    kubectl get services
    kubectl get deployments <application>
    kubectl get replicasets
    kubectl get sa                     # secret attachements
    
    kubectl create -f some.json

    kubectl get rc <node> -o yaml >some.yaml
    kubectl uptate -f some.yaml

    kubectl delete pod -l name=<name>
    kubectl delete services &lt;service>
    kubectl delete deployment &lt;application>

    kubectl run-container <name> --image=<image> --port=<port>

    kubectl resize --replicas=4 rc <name>

    kubectl expose rc <name> --port=<port> --public-ip=<ip>

## Testing kubectl Commands

Several commands allow passing "--dry-run" to test impact

    kubectl run --dry-run [...]

## Defining Limits and Quotas

Conceptionally "quotas" limit the resource usage per namespace while "limits" are maximum allocation amounts per resource type (e.g. cpu, memory, storage, network policies...)

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
            
JVM and CFS problems/solutions: https://engineering.squarespace.com/blog/2017/understanding-linux-container-scheduling

## Online Tutorials

- [Katacoda](https://www.katacoda.com/courses/kubernetes)

## Accessing Kubernetes API from pods

     curl -k -v --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt -H "Authorization: Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" https://<mycluster>

## Migration Stories

- Saltside: https://engineering.saltside.se/migrating-to-kubernetes-day-20-problems-fbbda4905c23

## Use Cases

- [Web Caching with Kubernetes](https://github.com/Financial-Times?utf8=%E2%9C%93&q=varnish)
- [MongoDB Replicas as Stateful Sets in GKE](https://pauldone.blogspot.de/2017/06/deploying-mongodb-on-kubernetes-gke25.html)
- [nginx SSL sidecar](https://vorozhko.net/kubernetes-sidecar-pattern-nginx-ssl-proxy-for-nodejs)
- Operators
     - [Kafka](https://github.com/strimzi/strimzi-kafka-operator)
     - [Couchbase](https://blog.couchbase.com/couchbase-on-openshift-in-action/)


## Misc

- [Issues when monitoring with Prometheus](http://linuxczar.net/blog/2017/06/15/prometheus-histogram-2/)
- [Debugging pods without netstat](https://staaldraad.github.io/2017/12/20/netstat-without-netstat/)

      cat /proc/net/tcp             # gives you raw data with hex numbers :-(
      
      grep -v "rem_address" /proc/net/tcp  | awk  '{x=strtonum("0x"substr($3,index($3,":")-2,2)); for (i=5; i>0; i-=2) x = x"."strtonum("0x"substr($3,i,2))}{print x":"strtonum("0x"substr($3,index($3,":")+1,4))}'
      
