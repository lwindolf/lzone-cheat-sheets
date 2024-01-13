## CLI

### Manage Servers

    stap-server start
    stap-server stop
    
    cat /var/log/stap-server/log
    
    stap --list-servers=all
    stap --list-servers=signer

### MOK Enrollment

See instructions in the [Redhat docs](https://www.redhat.com/sysadmin/secure-boot-systemtap)

### Running scripts

    stap <script file>
    stap <script file> --use-server=<server>
    stap -e <script string>
    
