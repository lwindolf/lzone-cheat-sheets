## Handling multiple clusters

    kubectl config view                    # Short list of clusters in ~/.kube/config
    kubectl config current-context         # Get current cluster
    kubectl config use-context <context>   # Switch to another context
    
    kubectl config unset current-context   # Clear context (useful for safety in scripts)
    
Merging 2 kube configs

    KUBECONFIG=~/.kube/config:/some/path/other-config kubectl config view --flatten > ~/.kube/config

## Cluster commands

    kubectl cluster-info

In general query resource types with

    kubectl get <type>
    kubectl describe <type plural> <name>

Useful "get" commands

    kubectl get nodes
    kubectl get pods
    kubectl get rc                     # replication controllers
    kubectl get namespaces
    kubectl get services
    kubectl get deployments <application>
    kubectl get replicasets
    kubectl get sa                     # secret attachements

A complete list of all ressource and CRDs you can get with

    kubectl api-resources
    kubectl api-resources --namespaced=false      # List only cluster-wide resources

Creating/manipulating resources

    kubectl create -f some.json
    kubectl delete -f some.json                   # Useful to delete the same resources with the same YAML!
    
    kubectl edit <type> <resource>                # Edit live, will automatically restart stuff

    kubectl get rc <node> -o yaml >some.yaml
    kubectl update -f some.yaml
    
    kubectl annotate <type> <name> [--overwrite=true] key=value

    kubectl delete pod -l name=<name>
    kubectl delete services &lt;service>
    kubectl delete deployment &lt;application>

    kubectl run-container <name> --image=<image> --port=<port>

    kubectl resize --replicas=4 rc <name>

    kubectl expose rc <name> --port=<port> --public-ip=<ip>

## Cluster Administration

Removing/Readding nodes

    kubectl drain <node>         # Evacuates all pods with replication controllers
    kubectl uncordon <node>      # Readd node for pod scheduling

## Testing kubectl Commands

Several commands allow passing "--dry-run" to test impact

    kubectl run --dry-run [...]
    
## Debugging in Pods

Running commands in pods

    kubectl exec <pod> [-n <namespace>] <command>
    
    kubectl exec <pod> -it bash      # Note some commands need a proper TTY (so add "-it")

Forwarding ports to pods

    kubectl port-forward -n <namespace> <pod> <local port>:<remote port>

For debugging network stuff it is always helpful to start a busybox pod
    
    kubectl run -it busybox --restart=Never --image=busybox

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

## Downward API

Using the [downward API](https://kubernetes.io/docs/tasks/inject-data-application/downward-api-volume-expose-pod-information/) you can expose pod resource infos to the pod itself via environment variables ...

    spec:
      containers:
      - env:
        - name: MY_CPU_REQUEST
          valueFrom:
            resourceFieldRef:
              resource: requests.cpu
        - name: MY_MEM_REQUEST
          valueFrom:
            resourceFieldRef:
              resource: requests.memory

... or a volume mount

    spec:
      containers: 
        [...]
        volumeMounts:
        - name: podinfo
          mountPath: /etc/podinfo
          readOnly: false
      volumes:
      - name: podinfo
        downwardAPI:
          items:
          - path: "labels"
            fieldRef:
              fieldPath: metadata.labels
          - path: "annotations"
            fieldRef:
              fieldPath: metadata.annotations


## Cron & Jobs

Trigger cron manually right now

     kubectl create job --from=cronjob/<the name of cron to run> <job name>

Automatically clean up cron job invocations

Either limit the history via optional spec fields:

    .spec.successfulJobsHistoryLimit 
    .spec.failedJobsHistoryLimit

## Shorter CLI 

With those two bash lines

    ns() {
        kubectl config set-context --current --namespace=$1 >/dev/null
    }
    alias k='kubectl "--context=${KUBECTL_CONTEXT:-$(kubectl config current-context)}"'

you can do stuff like

    ns myapp
    k get pods

## Online Tutorials

- [Katacoda](https://www.katacoda.com/courses/kubernetes)

## Accessing Kubernetes API from pods

     curl -v --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt -H "Authorization: Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" https://<mycluster>

## Migration Stories

- Saltside: https://engineering.saltside.se/migrating-to-kubernetes-day-20-problems-fbbda4905c23

## Use Cases

- [Web Caching with Kubernetes](https://github.com/Financial-Times?utf8=%E2%9C%93&q=varnish)
- [MongoDB Replicas as Stateful Sets in GKE](https://pauldone.blogspot.de/2017/06/deploying-mongodb-on-kubernetes-gke25.html)
- [nginx SSL sidecar](https://vorozhko.net/kubernetes-sidecar-pattern-nginx-ssl-proxy-for-nodejs)
- Operators
     - [Kafka](https://github.com/strimzi/strimzi-kafka-operator)
     - [Couchbase](https://blog.couchbase.com/couchbase-on-openshift-in-action/)


## Authn/Authz

List of auth proxy implementations

- [Openshift OAuth proxy](https://github.com/openshift/oauth-proxy) (forked from bitly, work with plain k8s too)
- [pusher OAuth2 proxy](https://github.com/pusher/oauth2_proxy) (continued work of bitly)
- [Buzzfeed OAuth2 SSO](https://github.com/buzzfeed/sso) 
- linkerd
- [Envoy](https://github.com/envoyproxy/envoy) (Istio)
- [Ambassador](https://github.com/datawire/ambassador) (Envoy based)
- Conjur + Auth Proxy
- [keyclock gatekeeper](https://github.com/keycloak/keycloak-gatekeeper)
- [Dex](https://github.com/dexidp/dex)

## Misc

- [Debugging pods without netstat](https://staaldraad.github.io/2017/12/20/netstat-without-netstat/)

      cat /proc/net/tcp             # gives you raw data with hex numbers :-(
      
      # Local endpoints
      grep -v "rem_address" /proc/net/tcp  | gawk  '{x=strtonum("0x"substr($2,index($2,":")-2,2)); for (i=5; i>0; i-=2) x = x"."strtonum("0x"substr($2,i,2))}{print x":"strtonum("0x"substr($2,index($2,":")+1,4))}'
      
      # Remote clients
      grep -v "rem_address" /proc/net/tcp  | gawk  '{x=strtonum("0x"substr($3,index($3,":")-2,2)); for (i=5; i>0; i-=2) x = x"."strtonum("0x"substr($3,i,2))}{print x":"strtonum("0x"substr($3,index($3,":")+1,4))}'
  
- Print all node ports using a Go template

      kubectl get svc --all-namespaces -o go-template='{{range .items}}{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}{{end}}'
      
      

<?speakerdeck,d25dce78d1d64f039b7e23bedd95d4f6,Security Best Practices?>
<?speakerdeck,ee213c61e742426693f965ba13850bd8,Multi-Tenancy?>
