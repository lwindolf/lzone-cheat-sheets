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
    
    kubectl get --raw='/readyz?verbose'           # basic cluster health checks

A complete list of all ressource and CRDs you can get with

    kubectl api-resources
    kubectl api-resources --namespaced=false      # List only cluster-wide resources

## Cluster Administration

Removing/Readding nodes

    kubectl drain <node>         # Evacuates all pods with replication controllers
    kubectl uncordon <node>      # Readd node for pod scheduling

## Creating/manipulating resources

Working with file based definitions you can issue the lifecycle commands using the same input file:

    kubectl create -f some.json
    kubectl apply  -f some.json
    kubectl diff   -f some.json
    kubectl delete -f some.json

Note that you can alway use `--dry-run` to review the effective changes

For existing resources you can use specific commands
    
    kubectl edit <type> <resource>                # Edit live, will automatically restart stuff
    kubectl delete <type> <resource>
   
    kubectl annotate <type> <name> [--overwrite=true] key=value

    kubectl run-container <name> --image=<image> --port=<port>

    kubectl resize --replicas=4 rc <name>

    kubectl expose rc <name> --port=<port> --public-ip=<ip>

    kubectl set env deployment/<name> <environment variable>=<value>
    kubectl set env deployment/<name> --list
    kubectl set env pods --all --list

## Rollouts

Both deployments and statefulset rollouts can be controlled with

    kubectl rollout restart sts/<name>
    kubectl rollout status --watch --timeout=120s sts/<name>

## Debugging in Pods

Running commands in pods

    kubectl exec <pod> [-n <namespace>] <command>
    
    kubectl exec <pod> -it bash      # Note some commands need a proper TTY (so add "-it")

Forwarding ports to pods

    kubectl port-forward -n <namespace> <pod> <local port>:<remote port>

For debugging network stuff it is always helpful to start a busybox pod
    
    kubectl run -it busybox --restart=Never --image=busybox

If you want to start an image with a different entrypoint or different parameters

    kubectl run -it <name> --image=<image> -- <param1> <param2>                        # Same entrypoint but different parameters
    kubectl run -it <name> --image=<image> --command -- <command> <param1> <param2>    # Different entrypoint and parameters

To start a debug pod for an init container

    kubectl debug <pod> -c <init container name>

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

## Modifying STS without downtime

Many fields in an STS cannot be changed. Sometimes you need to update an STS in production
and want no downtime. In this case remove it like this:

    kubectl delete sts <name> --cascade=false

This will ensure all pods stay up. Next create the STS with your new configuration and restart
the pods sequentially.

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

## Misc

- Solve hanging CRD delete by removing finalizers

      kubectl patch <crd type>/<name> -p '{"metadata":{"finalizers":[]}}' --type=merge 

- Debugging pods without netstat

      #!/bin/bash
        
      printf "%-5s %-21s %-21s %-10s\n" "ID" "Local Address" "Remote Address" "State"
      echo "-----------------------------------------------------------------------"
        
      while read -r sl local remote state rest; do
        # Strip the colon from the ID (e.g., "0:" becomes "0")
        id=${sl%:}
    
        # Robust header skip: if 'id' isn't a decimal number, skip the line
        [[ ! "$id" =~ ^[0-9]+$ ]] && continue
    
        decode_hex() {
            local hex_addr=${1%:*}
            local hex_port=${1#*:}
            
            # Convert 2-char hex chunks to decimal (Little Endian)
            # Using 16# prefix for base conversion
            local ip_d=$((16#${hex_addr:0:2}))
            local ip_c=$((16#${hex_addr:2:2}))
            local ip_b=$((16#${hex_addr:4:2}))
            local ip_a=$((16#${hex_addr:6:2}))
            
            local port=$((16#$hex_port))
            
            echo "$ip_a.$ip_b.$ip_c.$ip_d:$port"
        }
    
        case "$state" in
            01) s="ESTAB" ;; 02) s="SYN_SENT" ;; 03) s="SYN_RECV" ;;
            04) s="FIN_WAIT1" ;; 05) s="FIN_WAIT2" ;; 06) s="TIME_WAIT" ;;
            07) s="CLOSE" ;; 08) s="CLOSE_WAIT" ;; 09) s="LAST_ACK" ;;
            0A) s="LISTEN" ;; 0B) s="CLOSING" ;; *) s="UNKNOWN" ;;
        esac
    
        printf "%-5s %-21s %-21s %-10s\n" \
            "$id" "$(decode_hex $local)" "$(decode_hex $remote)" "$s"
    
      done < /proc/net/tcp

  
- Print all node ports using a Go template

      kubectl get svc --all-namespaces -o go-template='{{range .items}}{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}{{end}}'

- [Howto: Nightly pod restarts](https://stackoverflow.com/questions/52422300/how-to-schedule-pods-restart)

<?speakerdeck,d25dce78d1d64f039b7e23bedd95d4f6,Security Best Practices?>
<?speakerdeck,ee213c61e742426693f965ba13850bd8,Multi-Tenancy?>
