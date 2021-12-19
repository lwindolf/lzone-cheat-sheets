## Commands

    virsh list                # List running instances
    virsh list --all          # List all
    
    virsh nodeinfo            # Info on host node
    
    virsh quit                # Leave CLI

### Inspecting a guest
    
    virsh dominfo  <instance>
    virsh vcpuinfo <instance>
    virsh schedinfo <instance>

### Controlling guests

    virsh start    <instance>
    virsh reboot   <instance>
    virsh shutdown <instance>    # controlled shutdown
    virsh destroy  <instance>    # forced shutdown
    virsh suspend  <instance>
    virsh resume   <instance>

    virsh console  <instance>    # Quit using hotkey Ctrl-]
    
    virsh autostart <instance>   # Mark for autostart (on host boot)

### Define and change guests

    virsh dumpxml <instance> >guest.xml   # Dump to XML
    virsh create guest.xml                # Create from XML
    
    virsh edit <instance>                 # Restart guest afterwards to apply
    
    virsh define guest.xml                # Do not create, but load XML for <instance>, which later can be started by name
    virsh undefine <instance>

    virsh blockresize <instance> --path vda --size 100G

### Renaming 

    virsh domrename <old name> <new name>
    
## Resource Management

The following steps describe resource changes with restarting VMs. If you do not want this
you need to properly utilize maximum memory/CPU count. More details can be found [here](https://serverfault.com/questions/403561/change-amount-of-ram-and-cpu-cores-in-kvm).

### Change memory

To do so `virsh edit <instance>` and adapt &lt;memory>, &lt;currentMemory> and restart the VM.

### Change CPU count

To do so `virsh edit <instance> and adapt &lt;vcpu> and restart the VM.

### CPU scheduling

Change scheduler config on the fly with

     virsh schedinfo <instance> --set cpu_shares=<nr> --live --current --config
     virsh schedinfo <instance> --set vcpu_quota=<nr> --live --current --config
     virsh schedinfo <instance> --set vcpu_period=<nr> --live --current --config

### CPU Pinning

     virsh vcpupin <instance> <vcpu> <cpu affinity>

### Check CPU Features

Especially important to have [pcid CPU flag present in guests](https://groups.google.com/forum/m/#!topic/mechanical-sympathy/L9mHTbeQLNU)

    virsh capabilities | grep feature

## Misc

-   [libvirt XML documentation](http://libvirt.org/format.html)

