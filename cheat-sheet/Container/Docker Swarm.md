## CLI Commands

### Swarm Management

    docker swarm init --advertise-addr <ip>   # Set up master
    docker swarm init --force-new-cluster -advertise-addr <ip>   # Force manager on broken cluster
    
    docker swarm init –autolock               # Enable auto lock
    
    docker swarm join-token worker            # Get token to join workers
    docker swarm join-token manager           # Get token to join new manager
    
    docker swarm join <server> worker         # Join host as a worker
    
    docker swarm leave
    
    docker swarm unlock                       # Unlock a manager host after docker 
                                              # daemon restart when autolock is on
                                              
    docker swarm unlock-key                   # Print key needed for 'unlock'

### Handling nodes

    docker node ls                            # Print swarm node list
    docker node rm <node id>
    docker node inspect --pretty <node id>
    
    docker node promote <node id>             # Promote node to manager
    docker node demote <node id>

### Labelling nodes

    docker node update --label-add <key>=<value> <node>       # Add label
    docker node update --label-rm <key> <node>                # Remove label
    docker node inspect <node> | grep Labels -C5              # List labels

### Rebalancing

Forced rebalance (dangerous)

    for svc in $(docker service ls -q) ; do docker service update $svc --force ; done

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
    docker service rm <service id|name>
    docker service ls                                                    # list all services
    docker service ps <service id|name>                                  # list all tasks for given service (includes shutdown/failed)
    docker service ps --filter desired-state=running <service id|name>   # list running (acitve) tasks for given service
    
    docker service logs --follow <service id|name>                       # print console log of a service
