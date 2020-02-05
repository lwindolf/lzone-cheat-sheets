When you encounter a Redis instance and you quickly want to learn about
the setup you just need a few simple commands to peak into the setup. Of
course it doesn't hurt to look at the official [full command
documentation](http://redis.io/commands), but below is a listing just
for sysadmins.

### Accessing Redis

#### CLI

First thing to know is that you can use "telnet" (usually on Redis
default port 6379)

    telnet localhost 6379

or the Redis CLI client

    redis-cli

to connect to Redis. The advantage of redis-cli is that you have a help
interface and command line history.

#### CLI Queries

Here is a short list of some basic data extraction commands:

| Type                                 | Syntax and Explanation                            |
| ------------------------------------ | ------------------------------------------------- |
| Tracing                              | `monitor` Watch current live commands. Use with care when on production. Cancel with Ctrl-C. |
| Slow Queries                         | `slowlog get 25` Print top 25 slow queries        |
|                                      | `slowlog len`                                     |
|                                      | `slowlog reset`                                   |
| Search / List All Keys               | `keys <pattern` Use with care when on production! |
|                                      | `keys myprefix*`                                  |
|                                      | `keys *pattern*`                                  |
|                                      | `keys *mysuffix`                                  |
|                                      | `keys [a-c]*` Use grep like expressions           |
| Generic Key Handling                 | `del <key>` Delete key                            |
|                                      | `dump <key>` Serialize key                        |
|                                      | `exists <key>` Check for key                      |
|                                      | `expire <key> <seconds>` Set key TTL              |
| Working with scalar types            | `get <key>`                                       |
|                                      | `set <key> <value>`                               |
|                                      | `setnx <key> <value>` Set key value only if key does not exist |
|                                      | Batch commands:                                   | 
|                                      | `mget <key> <key> ...`                            |
|                                      | `mset <key> <value> <key> <value>`                |
| Working with counters                | `incr <key>`                                      |
|                                      | `decr <key>`                                      |
| Redis Lists                          | `lrange <key> <start> <stop>` Accessing lists     |
|                                      | `lrange mylist 0 -1` Output all elements          |
|                                      | `lindex mylist 5` Get 5th element                 |
|                                      | `llen mylist` Get list length                     |
|                                      |                                                   |
|                                      | `lpush mylist "value"` Push "value" to list       |
|                                      | `lpush mylist 5` Push number 5 to list            |
|                                      | `rpush mylist "value"` Push "value" to beginning (unshift) |
|                                      |                                                   |
|                                      | `lpushx mylist 6` Only push if mylist exists      |
|                                      | `rpushx mylist 7`                                 |
|                                      |                                                   |
|                                      | `lpop mylist` Remove+return value from list       |
|                                      | `rpop mylist` Remove+return value from start (shift) |
|                                      |                                                   |
|                                      | `lrem mylist 1 "value"` Remove 'value' count times|
|                                      | `lset mylist 2 6` Set 3rd element to value 6      |
|                                      | `ltrim <key> <start> <stop>`                      |
| Working with Redis Hashes            | `hexists myhash field1` Check if hash key exists  |
|                                      |                                                   |
|                                      | `hget myhash field1` Get key value                |
|                                      | `hdel myhash field2` Delete key                   |
|                                      | `hset myhash field1 "value"` Set key with "value" |
|                                      | `hsetnx myhash field1 "value"`                    |
|                                      |                                                   |
|                                      | `hgetall myhash` Get all hash content             |
|                                      | `hkeys myhash` List all keys                      |
|                                      | `hlen myhash` List number of keys                 |
|                                      |                                                   |
|                                      | Batch commands:                                   |
|                                      | `hmget <key> <key> ...` Get multiple keys         |
|                                      | `hmset <key> <value> <key> <value> ...` Set multiple keys |
|                                      |                                                   |
|                                      | Counter commands                                  |
|                                      | `hincrby myhash field1 1`                         |
|                                      | `hincrby myhash field1 5`                         |
|                                      | `hincrby myhash field1 -1`                        |
|                                      |                                                   |
|                                      | `hincrbrfloat myhash field2 1.123445`             |

#### CLI Scripting

For scripting just pass commands to "redis-cli". For example:

    $ redis-cli INFO | grep connected
    connected_clients:2
    connected_slaves:0
    $

#### Server Statistics

The statistics command is "INFO" and will give you an output as
following.

    $ redis-cli INFO
    redis_version:2.2.12
    redis_git_sha1:00000000
    redis_git_dirty:0
    arch_bits:64
    multiplexing_api:epoll
    process_id:8353
    uptime_in_seconds:2592232
    uptime_in_days:30
    lru_clock:809325
    used_cpu_sys:199.20
    used_cpu_user:309.26
    used_cpu_sys_children:12.04
    used_cpu_user_children:1.47
    connected_clients:2         # <---- connection count
    connected_slaves:0
    client_longest_output_list:0
    client_biggest_input_buf:0
    blocked_clients:0
    used_memory:6596112
    used_memory_human:6.29M         # <---- memory usage
    used_memory_rss:17571840
    mem_fragmentation_ratio:2.66
    use_tcmalloc:0
    loading:0
    aof_enabled:0
    changes_since_last_save:0
    bgsave_in_progress:0
    last_save_time:1371241671
    bgrewriteaof_in_progress:0
    total_connections_received:118
    total_commands_processed:1091
    expired_keys:441
    evicted_keys:0
    keyspace_hits:6
    keyspace_misses:1070
    hash_max_zipmap_entries:512
    hash_max_zipmap_value:64
    pubsub_channels:0
    pubsub_patterns:0
    vm_enabled:0
    role:master             # <---- master/slave in replication setup
    db0:keys=91,expires=88

### Changing Runtime Configuration

The command

    CONFIG GET *

gives you a list of all active configuration variables you can change.
The output might look like this:

    redis 127.0.0.1:6379> CONFIG GET *
     1) "dir"
     2) "/var/lib/redis"
     3) "dbfilename"
     4) "dump.rdb"
     5) "requirepass"
     6) (nil)
     7) "masterauth"
     8) (nil)
     9) "maxmemory"
    10) "0"
    11) "maxmemory-policy"
    12) "volatile-lru"
    13) "maxmemory-samples"
    14) "3"
    15) "timeout"
    16) "300"
    17) "appendonly"
    18) "no"
    19) "no-appendfsync-on-rewrite"
    20) "no"
    21) "appendfsync"
    22) "everysec"              # <---- how often fsync() is called
    23) "save"
    24) "900 1 300 10 60 10000"     # <---- how often Redis dumps in background
    25) "slave-serve-stale-data"
    26) "yes"
    27) "hash-max-zipmap-entries"
    28) "512"
    29) "hash-max-zipmap-value"
    30) "64"
    31) "list-max-ziplist-entries"
    32) "512"
    33) "list-max-ziplist-value"
    34) "64"
    35) "set-max-intset-entries"
    36) "512"
    37) "slowlog-log-slower-than"
    38) "10000"
    39) "slowlog-max-len"
    40) "64"

Note that keys and values are alternating and you can change each key by
issuing a "CONFIG SET" command like:

    CONFIG SET timeout 900

Such a change will be effective instantly. When changing values consider
also updating the redis configuration file.

### Databases

#### Multiple Databases

Redis has a concept of separated namespaces called "databases". You can
select the database number you want to use with "SELECT". By default the
database with index 0 is used. So issuing

    redis 127.0.0.1:6379> SELECT 1
    OK
    redis 127.0.0.1:6379[1]>

switches to the second database. Note how the prompt changed and now has
a "[1]" to indicate the database selection. To find out how many
databases there are you might want to run redis-cli from the shell:

    $ redis-cli INFO | grep ^db
    db0:keys=91,expires=88
    db1:keys=1,expires=0

#### Dropping Databases

To drop the currently selected database run

    FLUSHDB

to drop all databases at once run

    FLUSHALL

### Replication

#### Checking for Replication

To see if the instance is a replication slave or master issue

    redis 127.0.0.1:6379> INFO
    [...]
    role:master

and watch for the "role" line which shows either "master" or "slave".
Starting with version 2.8 the "INFO" command also gives you per slave
replication status looking like this

    slave0:ip=127.0.0.1,port=6380,state=online,offset=281,lag=0

#### Setting up Replication

If you quickly need to set up replication just issue

    SLAVEOF <IP> <port>

on a machine that you want to become slave of the given IP. It will
immediately get values from the master. Note that this instance will
still be writable. If you want it to be read-only change the redis
config file (only available in most recent version, e.g. not on Debian).
To revert the slave setting run

    SLAVEOF NO ONE

* * * * *

* * * * *

### Performance Testing

#### Benchmark

Install the Redis tools and run the provided benchmarking tool

    redis-benchmark -h <host> [-p <port>]

If you are migrating from/to memcached protocol check out [how to run
the same
benchmark](http://lzone.de/blog/Benchmarking-Redis-and-Memcache) for any
key value store with memcached protocol.

#### Debugging Latency

First measure system latency on your Redis server with

    redis-cli --intrinsic-latency 100

and then sample from your Redis clients with

    redis-cli --latency -h <host> -p <port>

If you have problems with high latency check if transparent huge pages
are disabled. Disable it with

    echo never > /sys/kernel/mm/transparent_hugepage/enabled

### Dump Database Backup

As Redis allows RDB database dumps in background, you can issue a dump
at any time. Just run:

    BGSAVE

When running this command Redis will fork and the new process will dump
into the "dbfilename" configured in the Redis configuration without the
original process being blocked. Of course the fork itself might cause an
interruption. Use "LASTSAVE" to check when the dump file was last
updated. For a simple backup solution just backup the dump file. If you
need a synchronous save run "SAVE" instead of "BGSAVE".

### Listing Connections

Starting with version 2.4 you can list connections with

    CLIENT LIST

and you can terminate connections with

    CLIENT KILL <IP>:<port>

### Monitoring Traffic

The propably most useful command compared to memcached where you need to
trace network traffic is the "MONITOR" command which will dump incoming
commands in real time.

    redis 127.0.0.1:6379> MONITOR
    OK
    1371241093.375324 "monitor"
    1371241109.735725 "keys" "*"
    1371241152.344504 "set" "testkey" "1"
    1371241165.169184 "get" "testkey"

additionally use "SLOWLOG" to track the slowest queries in an interval.
For example

    SLOWLOG RESET
    # wait for some time
    SLOWLOG GET 25

and get the 25 slowest command during this time.

## Sharding with proxies

There are two major proxy solutions

- Twemproxy (aka nutcracker, by Twitter)
- Codis
