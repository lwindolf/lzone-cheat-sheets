## CLI Commands

### Cluster Management

    docker swarm init --advertise-addr <ip>   # Set up master
    docker swarm init --force-new-cluster -advertise-addr <ip>   # Force manager on broken cluster
    
    docker swarm join-token worker            # Get token to join workers
    docker swarm join-token manager           # Get token to join new manager
    
    docker swarm join <server> worker         # Join host as a worker
    
    docker swarm leave
    
    docker swarm unlock                       # Unlock a manager host after docker 
                                              # daemon restart when autolock is on
                                              
    docker swarm unlock-key                   # Print key needed for 'unlock'
    
    docker node ls                            # Print swarm node list
    docker node rm <node id>
    docker node inspect --pretty <node id>
    
    docker node promote <node id>             # Promote node to manager
    docker node demote <node id>

### Rebalancing

Forced rebalance (dangerous)

    docker service ls -q > dkr_svcs && for i in `cat dkr_svcs`; do docker service update "$i" --detach=false --force ; done

Draining a node

    docker node update --availability drain <node id>
    
Undrain

    docker node update --availability active <node id>

### Managing Services

    docker stack ls
    docker stack rm <name>
    
    docker service create <image>
    docker service create --name <name> --replicas <number of replicas> <image>
    docker service scale <name>=<number of replicas>
    docker service rm <service id>
    docker service ls
    docker service ps <service id>
    
    docker service logs
