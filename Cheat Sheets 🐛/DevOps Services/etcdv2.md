---
related:
  cheat-sheet: etcd
---

This cheat sheet is for etcd v2 only!

## CLI Commands

Cluster infos

    etcdctl endpoint health
    etcdctl endpoint status -w table
    
    etcdctl member list
    etcdctl member list -w table

    etcdctl ls  /_etc/machines --recursive    # List all known hosts
    etcdctl get /_etc/machines/<token>        # Details of a host
    etcdctl get /_etc/config
    
Accessing the key space

    etcdctl ls /              # Get top-level keys
    etcdctl ls / --recursive  # Get full tree
    
    etcdctl get <key path>                      # Get key details
    etcdctl get <key path> --print-value-only   # Get key value only
    etcdctl get <key path> --rev=<number>       # Get older revision of a key
    etcdctl -o extended get <key path>          # Get key and metadata
    etcdctl get <key path> -w=json              # Output in JSON with metadata
    
Batch queries
    
    etcdctl get key1 key10                      # Get all keys key1, key2, key3, ..., key10
    etcdctl get --prefix key                    # Get all keys matching ^key
    etcdctl get --prefix key --limit=10         # Get max 10 keys matching ^key

Creating a path

    etcdctl mkdir /newpath
    etcdctl rmdir /newpath     # Removes only empty paths

Manipulate keys

    etcdctl mk     /path/newkey some-data       # Create key
    etcdctl set    /path/newkey some-data       # Create or update key
    etcdctl update /path/key new-data           # Update key
    etcdctl put    /path/key new-data
    etcdctl rm     /path/key
    etcdctl rm     /path --recursive
    
Make data and paths expire by passing --ttl when creating paths

    etcdctl mkdir     /path --ttl 120     # Path with expiration
    etcdctl updatedir /path --ttl 120     # Reset path expiration
    
Monitoring paths

    etcdctl watch /path
    etcdctl watch --recursive /path
    
    # Trigger command on event
    etcdctl watch --recursive /path -- printf "Path /path was changed.\n"
    
Compacting revisions

    etcdctl compact <number>     # Drop all revisions older than <number>
    
## HTTP JSON API Usage

Sample curl

    curl -L http://127.0.0.1:4001/v2/keys/

Endpoints examples are

    /version
    
    /v2/stats/self         # Node info
    /v2/stats/store        # Statisitics ops/s
    /v2/stats/leader       # Cluster master/slave details
    
    /v2/keys
    /v2/keys/?recursive=true

Separately from the port 4001 cluster API there is also an admin API for configuration changes 
on default port 7001

    /v2/admin/config       # GET returns settings, XPUT changes settings
    /v2/admin/machines     # Cluster details
    
