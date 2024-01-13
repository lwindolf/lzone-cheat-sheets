
## Scaling Graphite

When scaling the first bottlenecks to run into are

- CPU usage: Python based relay and cache use lots of CPU for parsing
  - Solve by switching to compiled versions for example
    - [go-carbon](https://github.com/lomik/go-carbon)
    - [carbon-c-relay](https://github.com/grobian/carbon-c-relay)
    
- CPU usage: When running relays and caches on the same host
  - Decouple on different hosts

### Graphite Replacements

When you scale beyond Graphite

- InfluxDB can ingest Graphite Traffic
- M3DB allows you to continue to use Graphite Queries against its TSDB
- [Replacing Graphite with Prometheus](https://www.robustperception.io/replacing-graphite-with-prometheus)
