### CLI

    # Binary usually
    cli=/opt/couchbase/bin/couchbase-cli

    # Always provide credentials
    auth="-u Administrator -p 12345"

    $cli server-list $auth -c localhost
    $cli server-info $auth -c <host>

    # Add to cluster
    $cli server-add $auth -c localhost --server-add=<host>   # add only
    $cli rebalance  $auth -c localhost --server-add=<host>

    # Remove from cluster
    $cli rebalance  $auth -c localhost --server-remove=<host>

    # Groups
    $cli group-manage $auth -c localhost --list
    $cli group-manage $auth -c localhost --<create|delete> --group-name=<name>

    # Buckets
    $cli bucket-edit $auth -c localhost \
           --bucket=<name> \
           --bucket-port=11222 \
           --bucket-ramsize=1000 \
           --bucket-eviction-policy=fullEviction \
           --enable-flush=1 \
           --bucket-priority=high

### REST API

    /pools
    /pools/default
    /pools/<pool name>

    /pools/default/buckets/<bucket name>/docs/<id>
