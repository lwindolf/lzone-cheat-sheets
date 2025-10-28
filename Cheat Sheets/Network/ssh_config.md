# ssh_config

Configuration you can use in `~/.ssh/config` or `/etc/ssh_config`

## Per Host Keys

    Host example.com
      IdentityFile ~/.ssh/example.com_id_rsa

## Agent Forwarding

[Agent Forwarding](http://www.unixwiz.net/techtips/ssh-agent-forwarding.html) explained with pictures!

    Host *
      ForwardAgent yes

## Multiplexing Connections

This is done using a "ControlMaster". This means the first SSH sessions
connection will be used for all following ones saving you the connection
overhead. **Note:** when you kill the first connection, all connections
will die! Also the first connection won't terminate even if you request
it to.

Create directory `~/.ssh/tmp` before using below snippet

    ControlMaster auto
    ControlPath /home/<user name>/.ssh/tmp/%h_%p_%r

If you are using such an SSH configuration and want a real new
connection add "-S" to the ssh invocation.

## Use Gateway/Jumphost

You can configure jumphosts using ProxyCommand and netcat:

    Host unreachable_host
      ProxyCommand ssh -e none gateway_host exec nc %h %p

## Automatic Jump Host Proxying

    Host <your jump host>
      ForwardAgent yes
      Hostname <your jump host>
      User <your user name on jump host>

Note the server list can have wild cards, e.g. "webserver-* database*"

    Host <server list>
      User <your user name on all these hosts>
      ProxyCommand ssh -q <your jump host> nc -q0 %h 22

## Automatic Port Knocking

    Host myserver
       User myuser
       Host myserver.com
       ProxyCommand bash -c '/usr/bin/knock %h 1000 2000 3000 4000; sleep 1; exec /bin/nc %h %p'

