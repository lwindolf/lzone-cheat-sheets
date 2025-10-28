## OpenSSH Commands

Copy Keys

    ssh-copy-id [-i keyfile] [email protected]

100% non-interactive SSH: What parameters to use to avoid any
interaction.

    ssh -i my_priv_key -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
    -o PreferredAuthentications=publickey user@host -n "/bin/ls"

Using SSH Agent

    eval $(ssh-agent)               # Start agent on demand

    ssh-add -l                      # List keys
    ssh-add                         # Add default key
    ssh-add ~/.ssh/id_rsa           # Add specific key
    ssh-add -t 3600 ~/.ssh/id_rsa   # Add with timeout
    ssh-add -D                      # Drop keys

    ssh -A ...                      # Enforce agent forwarding

[Transparent Multi-Hop](http://sshmenu.sourceforge.net/articles/transparent-mulithop.html)

    ssh -A -t host1 ssh -A -t host2 ssh -A -t host3 ...

## SOCKS proxy

Start a SOCKS proxy with

    ssh -D 44444 <remote host>
    
For a reverse SOCKS proxy run

    # OpenSSH >7.6
    ssh myserver -R44445:localhost
    
    # OpenSSH <7.6
    ssh -f -N -D 44444 localhost           # Start proxy locally
    ssh myserver -R44445:localhost:44444   # Connect it via remote port-forwarding

To use a socks proxy configure env

    export HTTPS_PROXY=socks5://localhost:4445/   # Configure remote host to use the SOCKS forwarding
    export HTTP_PROXY=socks5://localhost:4445/

## ssh\_keygen

Extract public key from private key using ssh-keygen

    ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub
    
Enfore no passphrase
    
    ssh-keygen -t rsa -N ""

## Troubleshooting

### Pseudo-terminal will not be allocated...

This happens when piping shell commands through SSH. Try adding "-T" or
"-t -t" when doing sudo.

## Misc

-   [SFTP chroot with umask](http://jeff.robbins.ws/articles/setting-the-umask-for-sftp-transactions):
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

-   [MonkeySphere](http://web.monkeysphere.info/): Use GPG keys with SSH agent

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
