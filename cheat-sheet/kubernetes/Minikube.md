## Starting a host

Using VirtualBox so you have to specify VM details:

    minikube start  --disk-size=2g --cpus=2 --memory=2000 --vm-driver=virtualbox
    
Using your local docker daemon

    minikube start --driver=docker

Starting with special kubernetes version

    minikube start --kubernetes-version=1.19.0

## Debugging

In general check start status with

    minikube status

If docker is unreachable check if TCP port 2375 is open on localhost.
