## Commands

Use "redis-cli" with port 26379 to connect to sentinel. Note: you always want to tail the /var/log/sentinel/sentinel.log on all sentinels to see the cluster interaction.

    redis-cli -p 26379
   
Dump information

    info                                                # full info
    
Determine the cluster master

    sentinel masters                                    # to get all masters (or if you don't know the cluster name)
    sentinel master <your cluster id>                   # get current sentinel master
    sentinel get-master-addr-by-name <your cluster id>  # get current sentinel master IP
    
Determine slaves

    sentinel slaves <your cluster id>

Force failover

    sentinel failover <your cluster id>
