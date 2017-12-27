### CLI Usage

    # Connect with
    zkCli.sh -server 127.0.0.1:2181

    # Commands
    ls <path>
    get <path>
    set <path> 
    delete <path>

### Four Letter Commands

https://zookeeper.apache.org/doc/trunk/zookeeperAdmin.html#The+Four+Letter+Words

    echo dump | nc localhost 2181
    echo cons | nc localhost 2181
