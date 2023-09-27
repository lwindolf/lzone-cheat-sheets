## Enable Scraping in Kubernetes

Scraping is either enabled globally or explicitly.

For explicit scraping add the following annotation for Pods or services.

    ---
    apiVersion: v1
    kind: Service
    metadata:
       name: my-service
       annotations:
         prometheus.io/scrape: "true"
         prometheus.io/path: "/metrics"            # optional
         prometheus.io/port: "9102"
         
Note that for Daemonsets you have to put the annotation in the template spec:

    ---
    apiVersion: apps/v1beta2
    kind: DaemonSet
    spec:
      [...]
      template:
        metadata:
          [...]
          annotations:
            prometheus.io/scrape: 'true'
            prometheus.io/port: '9102'

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
    sum by(a,b)(mymetric{field="value")
    
    # Math
    (instance_memory_limit_bytes - instance_memory_usage_bytes) / 1024 / 1024
    
    # Top keys
    topk(3, sum(rate(instance_cpu_time_ns[5m])) by (app, proc))

    # Count and group
    count(instance_cpu_time_ns) by (app)

## Problems of Prometheus

- [Issues with quantile calculation](http://linuxczar.net/blog/2017/06/15/prometheus-histogram-2/)

## Great Dashboards

- [Grafana k8s Cost Report](https://grafana.com/grafana/dashboards/8670)

## Scaling Prometheus

### Self-hosted TSDB

- [Cortex, OpenSource](https://www.cncf.io/blog/2018/12/18/cortex-a-multi-tenant-horizontally-scalable-prometheus-as-a-service/)
- [M3DB](https://github.com/m3db), see also [Quick Setup HowTo](https://lzone.de/blog/Prometheus+and+M3DB+in+Docker+in+5min)
- [Grafana Mimir](https://github.com/grafana/mimir)
- [Thanos](https://thanos.io/)

## SaaS

- GrafanaCloud
- Influx

## Infrastructure Monitoring

- [Blackbox Exporter](https://github.com/prometheus/blackbox_exporter) (allows defining TCP, HTTP... checks for non-k8s endpoints)
- [Adding many Blackbox Exports](https://medium.com/geekculture/single-prometheus-job-for-dozens-of-blackbox-exporters-2a7ba492d6c8)
- [Running multi-target exporters](https://prometheus.io/docs/guides/multi-target-exporter/)
