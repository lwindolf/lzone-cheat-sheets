## Pod DNS Name

Easiest way for lookup is dumping /etc/resolv.conf

    sh-4.2# cat /etc/resolv.conf
    search test.svc.cluster.local svc.cluster.local cluster.local eu-west-1.compute.internal
    nameserver 172.30.0.10
    options ndots:5

So this pod can be reached via `<name>.test.svc.cluster.local` with `<name>` being the deployment name and `test` being the namespace.

## [Pod DNS Policy](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy)

    kubectl get pod <name> -o "jsonpath={.spec.dnsPolicy}"

usually returns `ClusterFirst` indicating internal resolution.

## CoreDNS

### Adding an external nameserver

This is done using the `forward` plugin. Add a server section to your Corefile like this

    .example.net:53 {
       forward . 1.1.1.1
    }
    
this would resolve `example.net` via Cloudflare DNS.

## Misc

- [Configuring CoreDNS operator in Openshift](https://lzone.de/cheat-sheet/Openshift#coredns)
- [Performance impact of `ndots:5` default in /etc/resolv.conf](https://pracucci.com/kubernetes-dns-resolution-ndots-options-and-why-it-may-affect-application-performances.html)
