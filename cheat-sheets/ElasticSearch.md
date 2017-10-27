HTTP API
--------

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

### Tuning

-   [codecentric.de Tuning
    Hints](https://blog.codecentric.de/en/2014/05/elasticsearch-indexing-performance-cheatsheet/)

