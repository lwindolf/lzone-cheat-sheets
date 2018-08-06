## Reloading

Before reloading remember to regnerate "/etc/audit/audit.rules" by running "augenrules" first:

     augenrules && systemctl restart auditd
     
## Rule Examples

    -D                                      # Clear all rules
   
    -a exit,always -F msgtype=USER_ERR      # All login errors

Manually adding rules

    auditctl -a always,exit -F arch=b64 -F pid=<pid> -S open -k <trace name>

## Querying traces

    ausearch -k <trace name>

## Connecting to syslog

This is done using an audisp plugin, which is disabled per default. Enable it setting 
"active=yes" in /etc/audisp/plugins.d/syslog.conf and reload auditd.
