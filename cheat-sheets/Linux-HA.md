### Heartbeat

Manual IP Failover

    # Either run on the node that should take over
    /usr/share/heartbeat/hb_failover

    # Or run on the node to should stop working
    /usr/share/heartbeat/hb_standby

### keepalived

VRRP Debugging:

    tcpdump -vvv -n -i any host 224.0.0.18

    grep Keepalived /var/log/syslog

### Pacemaker

    # Cluster Resource Status
    crm_mon
    crm_mon -1
    crm_mon -f   # failure count

    # Dump and Import Config
    cibadmin --query --obj_type resources >file.xml
    cibadmin --replace --obj_type resources --xml-file file.xml

    # Resource Handling
    crm resource stop <name>
    crm resource start <name>
    crm resource move <name> <node>

    # Clear failed actions and reload
    crm_resource -P

    # Put entire cluster in maintenance
    crm configure property maintenance-mode=true
    crm configure property maintenance-mode=false

    # Unmanaged Mode for single services
    crm resource unmanage <name>
    crm resource manage <name>

[Pacemaker - Setup
Steps](http://varwww.com/2013/06/18/simple-pacemaker-tutorial-for-ubuntu/)

### wackamole

    wackatrl -l     # List status
    wackatrl -f     # Remove node from cluster
    wackatrl -s     # Add node to cluster again
