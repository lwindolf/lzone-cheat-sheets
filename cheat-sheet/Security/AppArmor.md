---
related:
  cheat-sheet: ['SELinux']
---

### Basics

[Debug Apparmor](http://aslakjohansen.wordpress.com/tag/aa-complain/):
How to determine which permissions prevent some type of access.

    # Allow access and enable tracing
    aa-complain /usr/sbin/httpd

    # Dump results
    aa-logprof

Commands

    aa-status

    aa-complain /usr/sbin/httpd # Disable profile
    aa-enforce /usr/sbin/httpd  # Enable profile

    ls /etc/apparmor.d/*        # Profile files
    ls /etc/apparmor.d/disable/*    # Disabled profiles

    aa-genprof <executable>   # Create new profile for binary

### Force stopping/removing AppArmor

    invoke-rc.d apparmor kill
    update-rc.d -f apparmor remove

### Disable for LXC

In Debian add in /usr/share/lxc/config/debian.common.conf

    lxc.aa_profile = unconfined

to get all new containers without AppArmor
