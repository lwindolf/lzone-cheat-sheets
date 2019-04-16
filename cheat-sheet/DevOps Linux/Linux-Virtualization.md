Most of the content is now in separate cheat sheets:

<?add topic='Docker'?>
<?add topic='KVM'?>
<?add topic='LXC'?>
<?add topic='OpenNebula'?>
<?add topic='OpenVZ'?>
<?add topic='systemd'?>
<?add topic='Vagrant'?>
<?add topic='VirtualBox'?>
<?add topic='VM Tuning'?>
<?add topic='Xen'?>


### Misc

-   [Control Groups](https://lwn.net/Articles/604609/): Detailed LWN
    article

#### Detect VM

[Detect if you are in a virtual
machine](http://people.redhat.com/~rjones/virt-what/)

    virt-what

#### Test for HW virtualisation

    egrep --color "svm|vmx" /proc/cpuinfo

    # svm flag for AMD V
    # vmx flag for Intel VT

#### Image Building Solutions

-   [packer.io](https://www.packer.io) - builds EC2, DigitalOcean, GCE,
    QEMU, VirtualBox, VMWare
-   [Veewee](https://github.com/jedi4ever/veewee) - (Ruby) builds
    Vagrant boxes, KVM, VirtualBox and VMWare images

