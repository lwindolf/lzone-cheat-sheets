## CLI

    sudo su -                   # Become root with root env
    
    sudo -n [<user>]            # Ensure to be non-interactive
    sudo -i [<user>]            # sudo and run login shells of the user
    sudo -l -U <user>           # List sudo permissions of given user
    
    visudo                      # Safely change sudoers file

## sudo: no tty present and no askpass program specified

Can be solved by adding

    Defaults:<user name> !requiretty
    Defaults:<user name> !visiblepw

at the end of /etc/sudoers. Note that this issue can also indicate a
password prompt when you run a different command than you expect. In
any case if you can't solve it check /var/log/auth.log to see what
the real command is.

