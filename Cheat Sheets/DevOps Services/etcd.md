---
related:
  cheat-sheet: etcdv2
---

This cheat sheet is for etcd v3 only!

## CLI Commands

Cluster infos

    etcdctl get /_etc/machines/<token>        # Details of a host
    etcdctl get /_etc/config
    
Accessing the key space

    etcdctl get "" --prefix --keys-only          # Get full tree
    etcdctl get "" --prefix                      # Get full tree keys and values
    
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
    etcdctl watch / --prefix              # Recursive watch
    
    # Trigger command on event
    etcdctl watch /path --prefix -- printf "Path /path was changed.\n"
    
Compacting revisions

    etcdctl compact <number>     # Drop all revisions older than <number>
    

    
