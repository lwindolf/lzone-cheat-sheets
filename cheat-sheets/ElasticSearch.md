## REST API

### Cluster Status

    http://<server>:9200/_cat/health?v
    http://<server>:9200/_cat/nodes?v
    http://<server>:9200/_cat/indices?v

Further introspection:

    http://<server>:9200/_nodes/
    http://<server>:9200/_nodes/process
    http://<server>:9200/_nodes/settings
    http://<server>:9200/_aliases

    # Starting with 1.4
    http://<server>:9200/_warmers
    http://<server>:9200/_mappings

### Indexes

    GET http://<server>:9200/_cat/indices?v
    GET http://<server>:9200/<index name>?pretty
    PUT http://<server>:9200/<index name>
    DELETE http://<server>:9200/<index name>

### Documents

    GET http://<server>:9200/<index name>/external/1?pretty

    # Insert/Replace
    PUT http://<server>:9200/<index name>/external/1
    { 'key': 'value' }

    # Update
    POST http://<server>:9200/<index name>/external/1
    { "doc": { 'count': 5 } }

    POST http://<server>:9200/<index name>/external/1
    { "script": "ctxt._source.count += 1" }

    DELETE http://<server>:9200/<index name>/external/1
    DELETE http://<server>:9200/<index name>/external/_query
    { "query": { "match": { 'key': 'value' } }

Batch processing

    POST http://<server>:9200/<index name>/external/_bulk
    {"index":{"_id":"1"}}
    {"key1": "value1"}
    {"index":{"_id":"2"}}
    {"key2": "value2"}
    {"update":{"_id":"3"}}
    {"doc": { "key3": "value3" }
    {"delete":{"_id":"4"}}
    [...]

### Queries

Just a simple search example to explain query building

    GET http://<server>:9200/<index name>/external/_search?q=*
    POST http://<server>:9200/<index name>/external/_search
    {
       "query": { "match": { "field1": "abcdef" } },
       "sort": { "balance": { "order": "desc" } },
       "from": 10,
       "size": 10,
       "_source": ["field1", "field2"]
    }

## Management Tools

- Index retention: Curator
- Webadmin: Cerebro
- Auth: XPack Security (previously "Shield"), SearchGuard
- Alerting: Elastalert, Logagent, Sentinl
- Monitoring:
  - by Elastic: Marvel, XPack

## Tuning

### Sizing Examples

- [Viki: ](https://engineering.viki.com/blog/2015/log-processing-at-scale-elk-cluster-at-25k-events-per-second/)
  - Ingest: 25k/s Access Logs
  - haproxy as Logstash LB
  - Logstash single-threaded filters, 4 Nodes (8 CPU, 16GB)
  - Logstash Forwarder Client with buffer log
  - Elasticsearch:
     - 20 Nodes (12 i7-3930k, 64GB, 3TB RAID0)
     - 20 shards, 4 replicas
     - 30GB heap
- [Meltwater: Running a 400+ cluster](http://underthehood.meltwater.com/blog/2018/02/06/running-a-400+-node-es-cluster/)
  - Search Volume: 3k/min complex search requests
  - Index Size: 3\*10^6 articles, 100\*10^6 social posts, 200TB 
  - Elastischsearch:
     - 430 data nodes: i3.2xlarge, 64GB RAM
     - 3 master nodes
     - 40k shards, 100MB cluster state!
     - 26GB heap

### Posts on Scaling:

- [codecentric.de Tuning
    Hints](https://blog.codecentric.de/en/2014/05/elasticsearch-indexing-performance-cheatsheet/)
- [hipages Engineering - Scaling ES](https://medium.com/hipages-engineering/scaling-elasticsearch-b63fa400ee9e)
  - Scaling on index size (metrics: documents per shard, documents per node)
    - Change shards to trade search response time for search concurrency
    - Change nodes to trade resilience for memory usage
  - Scaling on search time and througput
    - [Scalability Model](https://docs.google.com/spreadsheets/d/1F6AlBLR0F9D1SD2upTsHMiJpD7Sz50P_nurosP-WeUs/edit?usp=sharing)
- [Evolution of an ELK Setup](https://www.sumologic.com/wp-content/uploads/elk-stack-vs-sumologic.pdf)
   1. ELK with 1 Logstash
   2. ELK with loadbalanced horizontally scaled Logstash
   3. Kafka in front of logstash to buffer spikes ELK
   4. Separation of client, data and master Elasticsearch nodes
- [Determining the Number of Shards](https://www.elastic.co/guide/en/elasticsearch/guide/current/capacity-planning.html)

### General hints:

Note: credits for all those go to the post above. Consider this a compilation for ES begiinners.

- Disable transparent huge pages
- Disable numad
- Disable swap, lock memory with
     bootstrap.mlockall: true
- [Do not optimize JVM settings for max memory usage!](https://www.elastic.co/blog/a-heap-of-trouble)
   - Try to live with 4GB heap
   - Ensure not to give more than 30GB RAM (sometimes only as much as 26GB) as JVM heap address compression stops with larger RAM
   - Check heap address mode by running with -XX:+UnlockDiagnosticVMOptions -XX:+PrintCompressedOopsMode and if you see "zero based Compressed Oops" you are fine
   - Check your heap usage curve. If you have a sawtooth give back the memory to the FS cache.
 - When profiling
   - check for >15% ParNewGC
   - check SerialGC pauses
     - ensure you do not have the G1 garbage collector active

## Resilience

- Avoid split-brain by setting [discovery.zen.minimum_master_nodes](https://qbox.io/blog/split-brain-problem-elasticsearch)
- Monitor value key cache to avoid running in OOM killing your cluster

## Monitoring

- [Logstash Pipeline Monitoring](https://logz.io/blog/logstash-pipelines/) using XPack + Kibana
