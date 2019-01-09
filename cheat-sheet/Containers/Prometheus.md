## Query Syntax

From https://prometheus.io/docs/prometheus/latest/querying/examples/

    http_requests_total
    http_requests_total{job="apiserver", handler="/api/comments"}
    
    # Range query for 5min
    http_requests_total{job="apiserver", handler="/api/comments"}[5m]
    
    # Pattern matching
    http_requests_total{job=~".*server"}
    http_requests_total{status!~"4.."}

    # Aggregate and group by
    sum(rate(http_requests_total[5m])) by (job)
    
    # Math
    (instance_memory_limit_bytes - instance_memory_usage_bytes) / 1024 / 1024
    
    # Top keys
    topk(3, sum(rate(instance_cpu_time_ns[5m])) by (app, proc))

    # Count and group
    count(instance_cpu_time_ns) by (app)

## Problems of Prometheus

- [Issues with quantile calculation](http://linuxczar.net/blog/2017/06/15/prometheus-histogram-2/)

## Scaling Prometheus

### Self-hosted

- [Cortex, OpenSource](https://www.cncf.io/blog/2018/12/18/cortex-a-multi-tenant-horizontally-scalable-prometheus-as-a-service/)
- [M3DB](https://github.com/m3db)

## SaaS

- GrafanaCloud
- Influx
