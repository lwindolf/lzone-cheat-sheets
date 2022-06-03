## CLI

On Debian general config is in `/etc/default/grub` and scripts are in `/etc/grub.d/`

    grub-update                      # Create boot image
    grub-install /dev/sdX            # Install boot loader

## Configure CPU mitigations

Examples:

    # Newer kernels turns all off
    GRUB_CMDLINE_LINUX_DEFAULT="<params> mitigations=off"
    
    # Get most performance back
    GRUB_CMDLINE_LINUX_DEFAULT="<params> nopti nospectre_v2 nospec"
    
    # Disable everything for older kernels
    GRUB_CMDLINE_LINUX_DEFAULT="<params> noibrs noibpb nopti nospectre_v2 nospectre_v1 l1tf=off nospec_store_bypass_disable no_stf_barrier mds=off mitigations=off"

## Setting different default kernel

Find kernel id 

    grep "menuentry .*id_option.*gnulinux" /boot/grub/grub.cfg

Ids look like `gnulinux-5.11.0-18-generic-advanced-c0da4c73-db83-44f2-9a69-f6ad6a4dc7b4`
Once you've identified your new default id change the following line in /etc/default/grub:

    GRUB_DEFAULT=0
    
to something like

    GRUB_DEFAULT="gnulinux-5.11.0-18-generic-advanced-c0da4c73-db83-44f2-9a69-f6ad6a4dc7b4"

and run `sudo grub-update`

## Rescue System

When booting into rescue system 

      mount /dev/... /mnt               # Mount / filesystem
      mount /dev/... /mnt/boot          # Mount /boot
      mount --bind /dev /mnt/dev        # Bind mount /dev
      mount --bind /sys /mnt/sys        # Bind mount /sys
      mount --bind /proc /mnt/proc      # Bind mount /proc
      chroot /mnt

With these preparations you should be able to run fdisk, apt/yum/..., grub-update
