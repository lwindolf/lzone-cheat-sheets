## CLI

     mokutil --sb-state                    # Check whether SecureBoot is enabled
     mokutil -l                            # List enrolled keys
     
     dmesg | grep 'integrity: Loaded'      # List keys reported as imported by kernel
     
     mokutil --import MOK.der
     
     # Sign a kernel module
     /usr/src/kernels/$(uname -r)/scripts/sign-file sha256 \
         signing_key.priv \
         signing_key.x509 \
         my_module.ko
