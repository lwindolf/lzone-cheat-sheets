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
