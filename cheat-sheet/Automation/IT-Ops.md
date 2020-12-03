---
related:
  cheat-sheet: [ 'Solutions Automation', 'Solutions Monitoring', 'Solutions NoSQL', 'Solutions Virtualization']
---

This sheet cheat covers IT Ops solutions, roughly organized per process.
For a similar index have a look at
[http://sysadmin.it-landscape.info/](http://sysadmin.it-landscape.info/).

### Software Firewalls, LBs

-   [pfsense](http://pfsense.org/) OpenBSD firewall
-   [vyatta](http://vyatta.org/) Linux firewall
-   [Zen Load Balancer](http://zenloadbalancer.com/) (virtual appliance)
-   [HAProxy](http://haproxy.1wt.eu/) TCP LB
-   [Linux Virtual Server (LVS)](http://www.linuxvirtualserver.org/)
-   [ldirectord](http://horms.net/projects/ldirectord/)
-   [Ulta Monkey](http://www.ultramonkey.org/) (LVS based LB + Linux-HA)

### Install Servers

-   [Cobbler](http://www.cobblerd.org/)
-   [MAAS](http://www.ubuntu.com/cloud/tools/maas) - Ubuntu "Metal As A
    Service" install server
-   [Foreman](http://theforeman.org/) (integrated with puppet)
-   [SpaceWalk](http://spacewalk.redhat.com) (Kickstart based for Redhat
    and Solaris)
-   [Razor](https://github.com/puppetlabs/razor-server) (from
    Puppetlabs)

### Deployment

-   [CruiseControl](http://cruisecontrol.sourceforge.net/): CI
-   [Travis CI](https://travis-ci.org): Easy to use CI SaaS
-   [Jenkins CI](https://wiki.jenkins-ci.org): CI and Deployment Server
-   [Bamboo](https://www.atlassian.com/software/bamboo/): (available
    hosted with Jira Studio)
-   fabric: Language for deployment scripts
-   [CI Tools Index by Price
    Segment](http://citconf.com/wiki/index.php?title=Different_CI_Tools)

### Orchestration Tools

-   [JuJu](https://launchpad.net/juju): mostly for Ubuntu, service
    orchestration tool (Python, commercially backed)
-   [Maestro](http://www.maestrodev.com/) (enterprise, commercial)
-   [mcollective](http://puppetlabs.com/mcollective) - Puppet
    parallelizing and orchestration framework
-   [SaltStack](http://www.saltstack.com/community/)

### Orchestration Standards

-   [TOSCA](https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=tosca)
    (OASIS)

### Orchestration Frameworks

-   [calm.io](https://calm.io)
-   [Cloudify](http://getcloudify.org/)

### Security

-   [hackertarget.com/:](https://hackertarget.com/) Online Vulnerabity
    Scan (SaaS)

### Performance Debugging

-   [http://www.brendangregg.com/usemethod.html](http://www.brendangregg.com/usemethod.html)

### Monitoring

#### Graphing/Trending

-   rrdtool (arkane, do not use directly)
-   Cacti (arkane, do not use)
-   Munin (easy to setup, good graphs, great defaults, aged)
-   Ganglia
-   Graphite, Grafana, influxDB (good customization, aweful usability)
-   collectd

#### Active Service Checking

-   Nagios, Icinga
-   Nagios frameworks with Vendor Lock-in: Groundworks, OpsView, Zabbix
-   check\_mk (OSS, multi-site Nagios GUI)

#### SNMP based

-   Naemon

Real Time Metrics

-   Single Host only
    -   [netdata](https://github.com/firehol/netdata) (basic /proc, also
        MySQL and cgroups)
    -   [darkstat](https://unix4lyfe.org/darkstat/) (network only)

### Hosting / ISP

-   Hoster Index: [whdb.com/providers](http://whdb.com/providers)
-   Hoster Lookup:
    [whoishosthingthis.com](http://www.whoishostingthis.com/),
    [who-hosts.com](http://who-hosts.com/)
-   [iplist.net](http://iplist.net): Simple reverse lookup of neighbour
    IPs
-   Meta Status: [downdetector.com](https://downdetector.com/),
    [cloudharmony.com](https://cloudharmony.com)
-   [Cloud Provider Directory](https://cloudharmony.com/cloudsquare)
-   [Cloud Calculator](http://www.thecloudcalculator.com/) (compares
    self-hosting with cloud pricing)

### API Documentation

- RAML
- [Swagger](http://editor.swagger.io)

### Software Architecture

F5 Series on Architecture

 

1) Cloud/Automated Systems need an Architecture

[https://devcentral.f5.com/articles/cloud-automated-systems-need-an-architecture-26975](https://devcentral.f5.com/articles/cloud-automated-systems-need-an-architecture-26975)

 

2) The Service Model for Cloud/Automated Systems Architectures

[https://devcentral.f5.com/articles/the-service-model-for-cloud-automated-systems-architectures-27129](https://devcentral.f5.com/articles/the-service-model-for-cloud-automated-systems-architectures-27129)

 

3) The Deployment Model for Cloud/Automated Systems Architectures

[https://devcentral.f5.com/articles/the-deployment-model-for-cloud-automated-systems-architectures-27228](https://devcentral.f5.com/articles/the-deployment-model-for-cloud-automated-systems-architectures-27228)

 

4) The Operational Model for Cloud/Automated Systems Architectures

[https://devcentral.f5.com/articles/the-operational-model-for-cloud-automated-systems-architectures-27254?sf92906191=1](https://devcentral.f5.com/articles/the-operational-model-for-cloud-automated-systems-architectures-27254?sf92906191=1)

![](https://ssl.gstatic.com/ui/v1/icons/mail/images/cleardot.gif)

### People

#### Feature Management

-   [Feature
    Flags](http://swreflections.blogspot.de/2014/08/feature-toggles-are-one-of-worst-kinds.html)
-   [Levels of Feature
    Management](https://thenewstack.io/level-feature-management-right-team/?utm_content=buffer1b569&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer)

#### Collaboration

Git Code Review Solutions

-   [Atlassian Stash](https://de.atlassian.com/software/stash)
-   Gerrit (self-hosted, free)
-   [https://gerrithub.io/](https://gerrithub.io/) (commercial)
-   Gitlab (self-hosted, free, support available)
-   [github.com](https://github.com)
-   [gitorious.org](https://gitorious.org/)
-   [Phabricator](http://phabricator.org/comparison/)
-   [Documentation Testing: Inch CI](http://inch-ci.org/)
-   [Artifactory - Manage Binary
    Repositories](https://www.jfrog.com/confluence/display/RTF/Welcome+to+Artifactory)

Skills:

-   [Ops 8 Level
    Matrix](http://webcache.googleusercontent.com/search?q=cache:umLUawx4v6IJ:www.verber.com/mark/sysadm/ops-8level-matrix.xls+verber+ops+level&cd=1&hl=en&ct=clnk)
    (Skills per career level in Ops)

