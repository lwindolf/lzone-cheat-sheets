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
