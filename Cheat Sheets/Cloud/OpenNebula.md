## VM Commands

    onevm list            # List running instances
    onevm show <id>       # Info on running instance

    onevm stop <id(s)>
    onevm boot <id(s)>

    onevm suspend <id(s)>
    onevm resume <id(s)>

    onevm reboot <id(s)>
    onevm poweroff <id(s)>
    onevm shutdown <id(s)>
    onevm delete <id(s)>

    onevm migrate <id(s)> <host>
    onevm recover <id(s)> # Recover from failed migration

    onevm disk-attach <id(s)>
    onevm disk-detach <id(s)> <disk-id>

    onevm resize <id(s)> ...  # Offline resizing

    onetemplate instantiate "CentOS-6.4" --name "somename"
    onetemplate instantiate <id> --name <name> --memory 1024 --cpu 1 --vcpu 2 --nic <nic name>

## Host Commands

    onehost list
    onehost top
    onehost show <id>

    onehost create <host> -i kvm -v kvm -n <id>

## Network Commands

    onevnet list
    onevnet show <nr>

## Template Commands

    onetemplate list
    onetemplate clone <id> <name>
    onetemplate update <name>
