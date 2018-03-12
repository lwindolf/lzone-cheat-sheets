## Commands

Use "redis-cli" with port 26739 to connect to sentinel:

    redis-cli -p 26739
   
Dump information

    info                                                # full info
    sentinel master <your cluster id>                   # get current sentinel master
    sentinel get-master-addr-by-name <your cluster id>  # get current sentinel master IP
    
