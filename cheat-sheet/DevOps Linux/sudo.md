## CLI

    sudo su -                   # Become root with root env
    
    sudo -n [<user>]            # Ensure to be non-interactive
    sudo -i [<user>]            # sudo and run login shells of the user
    sudo -l -U <user>           # List sudo permissions of given user
    
    visudo                             # Safely change /etc/sudoers file
    visudo -f /etc/sudoers.d/<file>    # Edit sudoers.d file

To edit broken /etc/sudoers files

    pkexec visudo
    pkexec visudo -f /etc/sudoers.d/<file>

## sudo: no tty present and no askpass program specified

Can be solved by adding

    Defaults:<user name> !requiretty
    Defaults:<user name> !visiblepw

at the end of /etc/sudoers. Note that this issue can also indicate a
password prompt when you run a different command than you expect. In
any case if you can't solve it check /var/log/auth.log to see what
the real command is.

## sudo: Pseudo-terminal will not be allocated

Happens for example when you ssh + sudo. Insteaf of

    ssh myserver sudo vi /etc/passwed
    
do 

    ssh -t myserver sudo vi /etc/passwd

## Misc

- [/etc/sudoers.d Pitfalls](https://lzone.de/blog/etcsudoers.d-Pitfalls)
- [/etc/sudoers.d Syntax Oddities](https://lzone.de/blog/visudo-includedir-sudoers.d)
