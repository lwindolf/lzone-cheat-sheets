---
related:
   cheat-sheet: ['cgroups', 'Docker','KVM','LXC','OpenNebula', 'OpenVZ', 'Podman', 'systemd', 'Vagrant', 'VirtualBox', 'VM Tuning', 'Xen']
---

### Detect VM

[Detect if you are in a virtual machine](http://people.redhat.com/~rjones/virt-what/)

    virt-what

### Test for HW virtualisation

    egrep --color "svm|vmx" /proc/cpuinfo

    # svm flag for AMD V
    # vmx flag for Intel VT

### Check active cgroups version

    grep cgroup /proc/filesystems
    
should show

    nodev	cgroup
    nodev	cgroup2

#### Image Building Solutions

-   [packer.io](https://www.packer.io) - builds EC2, DigitalOcean, GCE,
    QEMU, VirtualBox, VMWare
-   [Veewee](https://github.com/jedi4ever/veewee) - (Ruby) builds
    Vagrant boxes, KVM, VirtualBox and VMWare images

