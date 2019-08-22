## OpenSSH Commands

Copy Keys

    ssh-copy-id [-i keyfile] [email protected]

100% non-interactive SSH: What parameters to use to avoid any
interaction.

    ssh -i my_priv_key -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no 
    -o PreferredAuthentications=publickey [email protected] -n "/bin/ls"

Using SSH Agent

    eval $(ssh-agent)       # Start agent on demand

    ssh-add -l                      # List keys
    ssh-add                         # Add default key
    ssh-add ~/.ssh/id_rsa           # Add specific key
    ssh-add -t 3600 ~/.ssh/id_rsa   # Add with timeout
    ssh-add -D                      # Drop keys

    ssh -A ...          # Enforce agent forwarding

[Transparent
Multi-Hop](http://sshmenu.sourceforge.net/articles/transparent-mulithop.html)

    ssh host1 -A -t host2 -A -t host3 ...

[How to use a SOCKS
Proxy](http://magicmonster.com/kb/net/ssh/socks_proxy.html)

On the client start proxy by

    ssh -D <port> <remote host>

Extract Public Key from Private Key

Use ssh-keygen

    ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub
    
    ssh-keygen -t rsa -N ""          # Create new keys without prompting for passphrase

## ssh\_config

Read the [authorized\_keys
HowTo](http://www.eng.cam.ac.uk/help/jpmg/ssh/authorized_keys_howto.html)
to learn about syntax and options...

### Per Host Keys

    Host example.com
    IdentityFile ~/.ssh/example.com_id_rsa

### Agent Forwarding

[Agent
Forwarding](http://www.unixwiz.net/techtips/ssh-agent-forwarding.html)
explained with pictures! Configured in /etc/ssh\_config with

    Host *
    ForwardAgent yes

### Multiplexing Connections

This is done using a "ControlMaster". This means the first SSH sessions
connection will be used for all following ones saving you the connection
overhead. **Note:** when you kill the first connection, all connections
will die! Also the first connection won't terminate even if you request
it to.

Create \~/.ssh/tmp before using below snippet

    ControlMaster auto
    ControlPath /home/<user name>/.ssh/tmp/%h_%p_%r

If you are using such an SSH configuration and want a real new
connection add "-S" to the ssh invocation.

### Use Gateway/Jumphost

You can configure jumphosts using ProxyCommand and netcat:

    Host unreachable_host
      ProxyCommand ssh -e none gateway_host exec nc %h %p

### Automatic Jump Host Proxying

    Host <your jump host>
      ForwardAgent yes
      Hostname <your jump host>
      User <your user name on jump host>

    # Note the server list can have wild cards, e.g. "webserver-* database*"
    Host <server list>
      ForwardAgent yes
      User <your user name on all these hosts>
      ProxyCommand ssh -q <your jump host> nc -q0 %h 22

### Automatic Port Knocking

    Host myserver
       User myuser
       Host myserver.com
       ProxyCommand bash -c '/usr/bin/knock %h 1000 2000 3000 4000; sleep 1; exec /bin/nc %h %p'

## Troubleshooting

### Pseudo-terminal will not be allocated...

This happens when piping shell commands through SSH. Try adding "-T" or
"-t -t" when doing sudo.

## Misc

-   [SFTP chroot with
    umask](http://jeff.robbins.ws/articles/setting-the-umask-for-sftp-transactions):
    How to enforce a umask with SFTP

        Subsystem sftp /usr/libexec/openssh/sftp-server -u 0002

-   Parallel SSH on Debian

        apt-get install pssh

    and use it like this

        pssh -h host_list.txt <command>
        pssh -i -t 60 -h host_list.txt -- <command>   # 60s timeout, list output

-   Clustered SSH on Debian

        apt-get install clusterssh

    and use it like this

        cssh server1 server2

-   Vim Remote File Editing:

        vim scp:[email protected]//some/directory/file.txt

-   [MonkeySphere](http://web.monkeysphere.info/): Use GPG keys with SSH
    agent

        monkeysphere subkey-to-ssh-agent -t 3600

### Port Knocking

Setup server:

    apt-get install knockd iptables-persistent

    # Change sequence numbers in /etc/knockd.conf
    # Default is sequence    = 7000,8000,9000

    # set START_KNOCKD=1 in /etc/default/knockd

    service knockd start

Use from client

    knock <server> <sequence>

e.g.

    knock example.com 7000 8000 9000

### "Secret" Hot Keys

SSH Escape Key: Pressing "\~?" (directly following a newline) gives a
menu for escape sequences:

    Supported escape sequences:
      ~.  - terminate connection (and any multiplexed sessions)
      ~B  - send a BREAK to the remote system
      ~C  - open a command line
      ~R  - Request rekey (SSH protocol 2 only)
      ~^Z - suspend ssh
      ~#  - list forwarded connections
      ~&  - background ssh (when waiting for connections to terminate)
      ~?  - this message
      ~~  - send the escape character by typing it twice
    (Note that escapes are only recognized immediately after newline.)

### SSHFS

To mount a remote home dir

     sshfs [email protected]: /mnt/home/user/

Unmount again with

    fuserumount -u /mnt/home/user
