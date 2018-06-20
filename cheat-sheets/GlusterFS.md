The following gives a quick overview on the different GlusterFS
administration tools.

## Add/Remove Peers

    # Add peer
    gluster peer probe <host name>

    # Remove peer
    gluster peer detach <host name>

## Print Cluster Status

You can list the status of all known peers by running.

    gluster peer status

## Print all GlusterFS Volumes

    gluster volume info all

## Mounting Volumes

You can do standard Unix mounting

    mount -t glusterfs server1:/volume /mnt/volume

which has the disadvantage of specifying one server IP. If this server
is down you can't mount the volume even though it is available. What is
important to know is that the given server is only used to fetch a
volume info file, which itself lists all servers providing this volume.
So the volume info file doesn't need to be on the volume servers. Also
remember as with NFS consider noatime mount options when you have many
small files accessed often.

### Problems on Ubuntu 12.04

When adding GlusterFS share to /etc/fstab do not forget to add
"\_netdev" to the mount options. Otherwise on next boot your system will
just hang!

Actually there doesn't seem to be a timeout. That would be nice too.

As a side-note: do not forget that Ubuntu 12.04 doesn't care about the
"\_netdev" even. So network is not guaranteed to be up when mounting. So
an additional upstart task or init script is needed anyway. But you need
"\_netdev" to prevent hanging on boot.

## Monitoring
### Nagios

Best use the glfs-health.sh script from
[http://www.sirgroane.net/2010/04/monitoring-gluster-with-nagios/](http://www.sirgroane.net/2010/04/monitoring-gluster-with-nagios/)
but you can also write a Nagios check just based on the GlusterFS
reported cluster status you get from "gluster peer info".

### Munin

You can enable monitoring using Munin for example to track protocol
command statistics with this Munin plugin
[https://github.com/acrollet/munin-glusterfs](https://github.com/acrollet/munin-glusterfs).

## Healing Split Brain

Check a helper Python script from here:
[http://www.gluster.org/2012/06/healing-split-brain/](http://www.gluster.org/2012/06/healing-split-brain/)

## Suggested Readings

To learn more on GlusterFS ensure to read the [Gluster File System
Administration
Guide](http://www.gluster.org/wp-content/uploads/2012/05/Gluster_File_System-3.3.0-Administration_Guide-en-US.pdf)
(PDF) from the official website. You might also want to check out the


