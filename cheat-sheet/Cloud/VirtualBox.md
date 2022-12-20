## Commands

    VBoxManage list
    VBoxManage list runningvms
    VBoxManage startvm <id>
    VBoxManage startvm <id> --type headless
    VBoxManage controlvm <id> stop

    # Change relative VM time
    VBoxManage modifyvm <id> -biossystemtimeoffset <offset in [ms]>

    # Interrupt network
    VBoxManage controlvm <id> setlinkstate1 off

Note: the difference of **controlvm** vs **modifyvm** is that the first
one is for running machines. They both have the same parameter syntax,
but **controlvm** doesn't support all of them.

## Signing vboxdrv

From https://stackoverflow.com/questions/61248315/sign-virtual-box-modules-vboxdrv-vboxnetflt-vboxnetadp-vboxpci-centos-8

    openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=VirtualBox/"
    chmod 600 MOK.priv
    mokutil --import MOK.der
    
    # Reboot
       
    for modfile in $(dirname $(modinfo -n vboxdrv))/*.ko; do
      echo "Signing $modfile"
      /usr/src/kernels/$(uname -r)/scripts/sign-file sha256 \
                                    /root/signed-modules/MOK.priv \
                                    /root/signed-modules/MOK.der "$modfile"
    done
    
    modprobe vboxdrv
