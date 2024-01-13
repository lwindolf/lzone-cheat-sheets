### Commands

    rabbitmqctl list_vhosts
    rabbitmqctl list_queues -p <vhost>

    rabbitmqctl cluster_status

    rabbitmqctl stop_app
    rabbitmqctl join_cluster <node>
    rabbitmqctl start_app

    rabbitmqctl report    # Dump detailed report on RabbitMQ instance  

    # Plugin management
    /usr/lib/rabbitmq/bin/rabbitmq-plugins enable <name>
    /usr/lib/rabbitmq/bin/rabbitmq-plugins list   

    # Live modifications using eval
    rabbitmqctl eval 'application:set_env(rabbit, reverse_dns_lookups, true).'

\# Convert disk node to RAM node\
 rabbitmqctl change\_cluster\_node\_type ram

 

### Configuring Limits

Find out about actual limits

    rabbitmqctl status | grep -A 4 file_descriptors
     {file_descriptors,
         [{total_limit,924},
          {total_used,831},
          {sockets_limit,829},
          {sockets_used,829}]},

To increase it to e.g. 10000 open files:

    rabbitmqctl eval 'file_handle_cache:set_limit(10000).'

### Misc

-   Managment GUI on port 15627
-   [RabbitMQ - Fix Chef 100% CPU
    usage](http://lzone.de/Solving+100%25+CPU+usage+of+Chef)
-   [RabbitMQ - Setup
    Clustering](http://varwww.com/2013/06/17/clustering-and-queue-mirroring-in-rabbitmq-looks-easy/)
-   [RabbitMQ RAM
    Nodes](http://lists.rabbitmq.com/pipermail/rabbitmq-discuss/2011-September/014878.html):
    can be used only in cluster with at least one disk node

        # /etc/rabbitmq.conf
         {cluster_nodes, {['[email protected]', '[email protected]', ...], ram}},

    On CLI:

        rabbitmqctl join_cluster --ram [email protected]

        # or if it is already in cluster
        rabbitmqctl change_cluster_node_type ram


