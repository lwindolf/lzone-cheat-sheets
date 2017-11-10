See also

#### Alarming / Paging / SMS Notification

All SaaS

-   PagerDuty
-   VictorOps
-   BigPanda
-   OpsGenie
-   AlertOps
-   iLert

#### DNS, Ping

-   [SmokePing - Monitoring network latency and
    loss](http://oss.oetiker.ch/smokeping/)

#### Network Mapping

Mapping Solutions

-   [NMPs
    Overview](http://www.slac.stanford.edu/xorg/nmtf/nmtf-tools.html#nmp-tool)
-   [FrameFlow](http://www.frameflow.com/)
-   [Solarwinds Topology
    Mapper](http://www.solarwinds.com/network-topology-mapper.aspx)
-   [ScienceLogic
    CloudMapper](http://www.sciencelogic.com/product/cloudmapper)

Network Forensics

-   [TNV: network visualizer](http://tnv.sourceforge.net/)
-   [Netgrok](http://www.cs.umd.edu/projects/netgrok/)

#### Host-based Service Monitoring

Self-hosted:

-   Nagios
-   Icinga 2
-   check\_mk
-   Shinken
-   Splunk
-   [Sensu](https://sensuapp.org/)
-   Groundworks

[SaaS
APM](https://www.quora.com/What-are-the-affordable-alternatives-to-NewRelic)

-   NewRelic
-   AppDynamics
-   DataDog
-   Dynatrace
-   Stackify Retrace
-   Ruxit
-   Sysdig Cloud

#### Docker/Kubernetes

See also this
[review](http://rancher.com/comparing-monitoring-options-for-docker-deployments/)

-   Prometheus
-   InfluxDB
-   DataDog (SaaS)
-   Sensu
-   Scout
-   Sysdig Cloud

#### External Website Monitoring

-   [gomez.com](http://www.gomez.com/) (now dynatrace)
-   [yottaa.com](http://www.yottaa.com/)
-   [monitis.com](http://www.monitis.com/)
-   [pingdom.com](http://www.pingdom.com/)
-   [Ruxit](https://ruxit.com/) (RUM)
-   [uptrends.com](http://www.uptrends.com/)

#### Status Page Hosting

-   [statuspage.io](https://www.statuspage.io)

#### Event Correlation

-   [SEC - Simple Event
    Correlation](http://simple-evcorr.sourceforge.net)

#### Tool / Service Support Matrix

This is a list of good plugins per service and monitoring solution

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                Munin                                                                                                               Graphite                                                                Other
  ------------- ------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------- ------------------------------------------------------------------------
  Apache        built-in                                                                                                            built-in                                                                 

  Couchbase     ?                                                                                                                   [couchbase\_collector](https://github.com/zooldk/couchbase_collector)   Couchbase itself

  Node.js       [nodejs-munin\                                                                                                      [node-graphite](https://github.com/felixge/node-graphite)               [Joyent Cloud Analytics](https://github.com/etsy/statsd) (Saas)\
                 Request Count Monitoring](https://github.com/benbuckman/nodejs-munin)                                                                                                                       [Etsy statsd\
                                                                                                                                                                                                             Appdynamics nodejs-monitoring](https://github.com/etsy/statsd) (SaaS)

  Node.js PM2   %                                                                                                                   ?                                                                       [Keymetrics](https://app.keymetrics.io/#/register) (SaaS)

  Tomcat        [Munin contrib - jstat\_\_heap](https://github.com/munin-monitoring/contrib/blob/master/plugins/java/jstat__heap)   ?                                                                        
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


