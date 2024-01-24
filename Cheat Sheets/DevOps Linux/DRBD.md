### Commands

    cat /proc/drbd

    drbdsetup 0 show

    drbdadm create-md <name>
    drbdadm attach <name>
    drbdadm syncer <name>
    drbdadm connect <name>
    drbdadm [--discard-my-data] connect <name>
    drbdadm disconnect <name>

    drbdadm primary <name>
    drbdadm secondary <name>

### Split Brain

If it occurs it will be logged to syslog

    grep "Split-Brain" /var/log/*

[Solution](http://www.ipserverone.info/dedicated-server/linux-2/how-to-fix-drbd-recovery-from-split-brain/):
Choose one node and run

    drbdadm secondary all
    drbdadm disconnect all
    drbdadm -- --discard-my-data connect all

Make other node primary

    drbdadm primary all
    drbdadm disconnect all
    drbdadm connect all

Check /proc/drbd again
