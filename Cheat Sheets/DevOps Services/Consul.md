## CLI Commands

Start an agent

    consul agent -server -bind=<ip> -client=<ip> -ui -data-dir=/data/consul -config-dir=/etc/consul -node=$(hostname) -datacenter=$datacenter &

Join a cluster

    consul join <ip> <ip> [<ip> [...]]
    
Show cluster info

    consul info        # show active config summary
    consul members     # show cluster members
    consul monitor     # tail activity log
    consul reload      # reload config
    
    consul keyring -list
    consul keyring -install
    consul keyring -use         # Use a key which was previously installed
    consul keyring -remove 
    
Accessing the key-value store

    consul kv get <path>
    consul kv get --detailed <path>    # include metadata
    consul kv put <path> <value>
    consul kv delete <path>

Dumping and importing values from/to JSON

    consul kv export [<prefix>] >values.json
    consul kv import <values.json

## REST API

Default Port is :8500

    /v1/catalog/nodes
    /v1/catalog/services
     
    /v1/agent/checks
    /v1/agent/services
    /v1/agent/service/register
     
    /v1/health/checks/<service>
