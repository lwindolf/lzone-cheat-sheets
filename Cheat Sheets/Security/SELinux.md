## Commands

Show SELinux labels on files

    ls -Z

Check if SELinux is on

    getenforce

Disable temporarily

    echo 0 >/selinux/enforce

    # or

    setenforce 0

Disable in grub.cfg by adding to kernel options

    selinux=0

Disable in /etc/selinux/config

    SELINUX=disabled
    SELINUXTYPE=targeted
    SETLOCALDEFS=0

Install [in Debian](https://wiki.debian.org/SELinux/Setup)

    apt-get install selinux-basics selinux-policy-default auditd
    selinux-activate
    # Reboot
    check-selinux-installation

Get activation status:

    sestatus
    getenforce

Install additional profiles:

    semodule -i my_module.pp
