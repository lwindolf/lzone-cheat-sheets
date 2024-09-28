---
related:
  cheat-sheet: 'Solutions Monitoring'
---

### Graphite, Diamond

-   Enabling Diamond collectors:

        echo "enabled = true" >> /etc/diamond/<name>Collector.conf

-   Checking Diamond collectors:

        diamond-setup -p -C <name>Collector

-   [grafana](https://grafana.org) - dashboards for all monitoring sources
-   [Graphite Clustering](https://bitprophet.org/blog/2013/03/07/graphite/)
-   Graphite Backends:
    -   Whisper (legacy): fixed-sized database
    -   Ceres: sparse data, arbitrary fixed-size resolutions

### Munin

- Munin - Test Plugins:

        /usr/sbin/munin-run <plugin name> # for values
        /usr/sbin/munin-run <plugin name> config # for configuration

- Munin - Test available plugins]

        /usr/sbin/munin-node-configure --suggest

        # and enable them using
        /usr/sbin/munin-node-configure --shell | sh

- Munin Server - Manual Update Run:

        sudo -u munin /usr/bin/munin-cron

### Nagios, Icinga

-   Icinga 1 - Object Tricks: Negative hostgroup definitions

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

-   [Mod-Gearman](https://mod-gearman.org/): Nagios distributed checking
    (previously called Naemon)
-   Gearman Debugging:

        gearman-top

### Misc

-   [Jolokia](https://jolokia.org/) JMX HTTP/JSON bridge +
    [jxm4perl](https://search.cpan.org/~roland/jmx4perl/scripts/jmx4perl)

