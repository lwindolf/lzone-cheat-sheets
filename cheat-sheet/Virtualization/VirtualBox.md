### Commands

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
