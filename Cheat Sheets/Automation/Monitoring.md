---
related:
  cheat-sheet: 'Solutions Monitoring'
---

### Graphite, Diamond

-   Enabling Diamond collectors:

        echo "enabled = true" >> /etc/diamond/<name>Collector.conf

-   Checking Diamond collectors:

        diamond-setup -p -C <name>Collector

-   [grafana](http://grafana.org) - Graphite / InfluxDB dashboard
-   [Graphite Clustering](http://bitprophet.org/blog/2013/03/07/graphite/)
-   Graphite Backends:
    -   Whisper (legacy): fixed-sized database
    -   Ceres: sparse data, arbitrary fixed-size resolutions

### Munin

-   Munin - Test Plugins:

        /usr/sbin/munin-run <plugin name> # for values
        /usr/sbin/munin-run <plugin name> config # for configuration

-   [Munin - Test available plugins](http://articles.slicehost.com/2010/4/9/enabling-munin-node-plug-ins-on-centos)

        /usr/sbin/munin-node-configure --suggest

        # and enable them using
        /usr/sbin/munin-node-configure --shell | sh

-   Munin Server - Manual Update Run:

        sudo -u munin /usr/bin/munin-cron

### Nagios, Icinga

-   [dmesg Nagios Plugin](/Nagios-Plugin-for-dmesg-Monitoring)
-   [Icinga 1 - status.cgi Parameters](http://docs.icinga.org/latest/en/cgiparams.html)
-   [Icinga 1 - Object Tricks](http://docs.icinga.org/latest/en/objecttricks.html):
    Negative hostgroup definitions

        define service {
            ...
            hostgroup_name   all,!testing
            ...
        }

-   Icinga 2 - Matching check definitions on hosts/hostgroups

        apply Service "MyService" {
            # service definition...

            assign where host.name == "MyHost1"
            assign where match("hostprefix-*", host.name)
            assign where "MyHostGroup" in host.groups
        }

-   [Mod-Gearman](http://mod-gearman.org/): Nagios distributed checking
    (previously called Naemon)
-   Gearman Debugging:

        gearman-top

### Misc

-   [Jolokia](http://jolokia.org/) JMX HTTP/JSON bridge +
    [jxm4perl](http://search.cpan.org/~roland/jmx4perl/scripts/jmx4perl)

