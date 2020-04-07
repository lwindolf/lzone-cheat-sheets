## Starting a host


    # Using VirtualBox
    minikube start  --disk-size=2g --cpus=2 --memory=2000 --vm-driver=virtualbox
    
    # Using docker
    minikube start --driver=docker
