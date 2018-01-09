## Commands

    virsh list                # List running
    virsh list --all          # List all

### Control instances

    virsh start <instance>
    virsh shutdown <instance>
    virsh destroy <instance>
    virsh suspend <instance>
    virsh resume <instance>

    virsh console <instance>

### Define instances
    virsh dumpxml <instance> >dump.xml
    virsh create dump.xml   # Create from XML
    virsh edit <instance>
    virsh undefine <instance>

    virsh blockresize <instance> --path vda --size 100G

    virsh dominfo
    virsh vcpuinfo
    virsh nodeinfo

    virsh quit   # Leave CLI
    
### Check CPU Features

Especially important to have [pcid CPU flag present in guests](https://groups.google.com/forum/m/#!topic/mechanical-sympathy/L9mHTbeQLNU)

    virsh capabilities | grep feature

### Misc

-   [libvirt XML documentation](http://libvirt.org/format.html)

