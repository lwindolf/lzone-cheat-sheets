---
related:
  cheat-sheet: ["Monitoring"]
---

## Concepts

- ["4" golden monitoring signals](https://www.infoq.com/articles/monitoring-SRE-golden-signals)
   - Metrics to choose from
     - Request Rate
     - Error Rate
     - Latency 
     - Saturation
     - Utilization
   - Golden Signals variants
     - Google SRE
     - USE Method
     - RED Method
- [TSZ Compression Technique](https://www.vldb.org/pvldb/vol8/p1816-teller.pdf) (Facebook Paper)
     
## TSDBs (Time Series DBs)

[Wide-range TSDB Comparison](https://docs.google.com/spreadsheets/d/1sMQe9oOKhMhIVw9WmuCEWdPtAoccJ4a-IuZv4fXDHxM/edit#gid=0)

- [M3](https://vimeo.com/274821002) (Prometheus, etcd, replication, Scale at Uber: 500Mio/s, Billions Storage)
- [Thanos](https://github.com/improbable-eng/thanos) (Prometheus, federation)
- [Grafana Mimir](https://github.com/grafana/mimir) (Prometheus, scale up to 1Mrd active time series)
- InfluxDB (commercial, replication, good scale)
- eXtremeDB (commericial)
- TimescaleDB (Postgres, replication)
- Graphite/Whisper (no replication)
- Prometheus
- DalmatinerDB
- Riak-TS
  
## Alarming / Paging / SMS Notification

SaaS Solutions:

- PagerDuty
- VictorOps
- BigPanda
- OpsGenie
- AlertOps
- iLert

## Status Page

SaaS Solutions:

- https://status.io
- https://statuspage.io
- https://pingdom.com
- https://cachethq.io/
- https://statusgator.com/
- [Upptime](https://github.com/upptime/upptime) (free, Github Pages based)

## DNS, Ping

- [SmokePing - Monitoring network latency and loss](http://oss.oetiker.ch/smokeping/)

## Network Mapping

Mapping Solutions

- [NMPs Overview](http://www.slac.stanford.edu/xorg/nmtf/nmtf-tools.html#nmp-tool)
- [FrameFlow](http://www.frameflow.com/)
- [Solarwinds Topology Mapper](http://www.solarwinds.com/network-topology-mapper.aspx)
- [ScienceLogic CloudMapper](http://www.sciencelogic.com/product/cloudmapper)

Network Forensics

- [TNV: network visualizer](http://tnv.sourceforge.net/)
- [Netgrok](http://www.cs.umd.edu/projects/netgrok/)

## Host-based Service Monitoring

Self-hosted:

- Nagios
- Icinga 2
- check_mk
- Shinken
- Splunk
- [Sensu](https://sensuapp.org/)
- Groundworks 

Saas APMs:

- NewRelic
- AppDynamics
- DataDog
- Dynatrace
- Stackify Retrace
- Ruxit
- Sysdig Cloud
- Instana
- [SignalFX](https://signalfx.com/)
- [SemaText](https://sematext.com/) (Metrics & Logs combined, correlation, Influx DB API for metrics, Elasticsearch API for logs)

## Docker/Kubernetes

See also this
[review](http://rancher.com/comparing-monitoring-options-for-docker-deployments/)

- Prometheus
- Hawkular
- DataDog (SaaS)
- Sensu
- Scout
- Sysdig Cloud

## External Website Monitoring

-   [gomez.com](http://www.gomez.com/) (now dynatrace)
-   [yottaa.com](http://www.yottaa.com/)
-   [monitis.com](http://www.monitis.com/)
-   [pingdom.com](http://www.pingdom.com/)
-   [Ruxit](https://ruxit.com/) (RUM)
-   [uptrends.com](http://www.uptrends.com/)

## Status Page Hosting

-  [Atlassian statuspage.io](https://www.statuspage.io)
-  [Statusgator](https://statusgator.com/)
-  [cstate](https://github.com/cstate/cstate)

## Event Correlation

-   [SEC - Simple Event
    Correlation](http://simple-evcorr.sourceforge.net)
