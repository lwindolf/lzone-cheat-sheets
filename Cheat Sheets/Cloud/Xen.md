## CLI

-   Test if you are running a Xen kernel:

        cat /sys/hypervisor/properties/capabilities 

-   [Xen vs. Xen
    Server](http://virtually-a-machine.blogspot.de/2009/09/open-source-xen-vs-xenserver.html)
-   [Xen - Commands](http://www.debian-administration.org/articles/533)

        xm list           # List all domains
        xm list vm1       # List status of a single VM
        xm list vm1 -l    # Details for a VM 
        xm create vm1     # Starts/Creates a VM
        xm reboot vm1     
        xm shutdown vm1
        xm destroy vm1

        xm network-list vm1

        xm console vm1     # Open console to VM (escape like telnet)

        xm info            # HV infos
        xm top             # Monitor HV and domains
        xm log             # View HV log

        xm dominfo
        xm vcpuinfo
        xm nodeinfo

-   Ensure guest auto start on boot:

        ln -s /etc/xen/<instance> /etc/xen/auto/<instance>

-   Find out which dom0 you are on:

        dmesg | grep "command line"

        # Should give you something like:
        #
        # Kernel command line:  ro root=/dev/VolGroup00/LogVol00 console=xvc0 hostip=10.0.0.17
        #
        # Where "hostip" is the IP of the hypervisor

-   Find out which IP a VM has:

        # Grep and resolve MAC:
        xm list -l <VM name> | grep mac
        arp -a | grep -i <MAC address>

## Xen Server

-   [Feature Matrix XenServer Free vs. Enterprise](http://wiki.xensource.com/xenwiki/XCP/XenServer_Feature_Matrix):
    Whats the difference and what features are provided by "xe" what
    "xm" doesn't have...
-   [XenServer GUI Comparison Free vs. Enterprise](http://www.dabcc.com/article.aspx?id=11045)
-   [Xen Server - Hanging Operation on Shutdown](http://hafizpariabi.blogspot.com/2011/09/unable-to-shutdown-hang-vm-on-xenserver.html):
    This happens when for example a reboot doesn't work and you want to
    perform a shutdown to quickly restore an unresponding VM. The first
    task (reboot) is ineffective and won't complete and thereby will
    block the second task (the shutdown). Destroying the VM domain
    solves the issue:

        xe vm-list                                          # 1. Resolve VM UUID with 
        list_domains | grep <uuid>                          # 2. Get Domain Id
        /opt/xensource/debug/destroy_domain -domid <domid>  # 3. Kill Domain Id
        xe vm-reboot uuid=<uuid> force=true                 # 4. Force Action

    An alternative is described
    [here](http://www.crucial.com.au/blog/2011/03/11/xenserver-vmvps-will-not-shutdown-force-shutdown/)
    and involves determining the hanging task and cancelling it:

        xe task-list                          # Get task uid
        xe task-cancel uuid=<task uuid>       # And cancel it

-   [XenServer - Add Another Physical Disk](http://www.xendesktopmaster.com/how-to-add-an-additional-local-disk-to-your-xenserver-5-5-host/):

        xe host-list                         # to get host UUID
        xe sr-create host-uuid=<host UUID> shared=false type=lvm \
           content-type=user device-config:device=/dev/sdb1 name-label="Another disk"

-   [XenServer - VM Paravirtualization](http://wiki.univention.de/index.php?title=Citrix_Xen_Server):
    How to configure a single VM to be paravirtualized:

        # Configure boot
        xe vm-param-set uuid=<VM UUID> HVM-boot-policy=''
        xe vm-param-set uuid=<VM UUID> PV-bootloader=pygrub

        # Configure console to work in XenCenter
        xe vm-param-set uuid=<VM UUID> PV-args="console=tty0 xencons=tty"

        # Determine boot disk and set it bootable for XenServer
        xe vbd-list vm-uuid=$VMUUID type=Disk
        xe vbd-param-set uuid=<disk UUID> bootable=true

-   [XenServer - Configure LACP Bonding](): When you want to run your
    XenServer with interface trunking.

        # Determine UUIDs of interfaces to add
        xe pif-list

        # Create new network (will return network UUID)
        xe network-create name-label=bond0

        # Create bonding (will return bonding UUID)
        xe bond-create network-uuid=<network UUID> pif-uuids=<first pif UID>,<second pif UID>[,...]

        # Set bonding flags for bond0
        xe pif-param-set uuid=<bond0 UUID> other-config:bond-mode=802.3ad
        xe pif-param-set uuid=<bond0 UUID> other-config:bond-mode=lacp

        # Once your switch is configured check bond0 with
        cat /proc/net/bonding/bond0

        # Also try
        ovs-appctl bond/show bond0

-   [XenServer - Restore VM from Image](http://support.citrix.com/servlet/KbServlet/download/17141-102-671564/XenServer_Pool_Replication_-_Disaster_Recovery.pdf):
    Use "xe vm-import" to create a new VM with a new UUID:

        xe vm-import filename=image.xva preserve=true

-   [Xen Server - Ubuntu bug: read-only filesystem](/blkfront+barrier+empty+write+xvda+op+failed)

