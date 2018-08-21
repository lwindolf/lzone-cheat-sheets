## CLI Commands for Kafka Topics

List existing topics

    /usr/bin/kafka-topics --zookeeper <zookeeper host:port> --list
    
Create a new topic

    /usr/bin/kafka-topics --create --zookeeper <zookeeper host:port>/kafka --replication-factor 2 --partitions 4 --topic <name>
    
Try to read from a topic

    /usr/bin/kafka-console-consumer --zookeeper  <zookeeper host:port> --topic <name>
    
Try to write to a topic on one or more brokers

    echo "Test data" | /usr/bin/kafka-console-producer --broker-list <broker1 host:port>,<broker2 host:port> --topic <name>

## Checking Kafka Consumers

Show consumer group configuration

    /usr/bin/kafka-consumer-groups --zookeeper <zookeeper host:port> --describe --group <group name>
    
To read messages read/written including lag per consumer in a consumer group

    /usr/bin/kafka-consumer-offset-checker --group <group name> --topic <name> --zookeeper <zookeeper host:port>


## Syslog to Kafka

- Using rsyslog: https://www.drivenbycode.com/how-truecar-uses-kafka-for-high-volume-logging-part-2/

## Monitoring Tools

- Kafka Monitor (no auth support)
- Kafka Manager (by Yahoo)
- Burrows (JSON endpoint only, with good lag health prediction)
