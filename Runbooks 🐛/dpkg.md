This runbook describes how to handle dpkg problems with half-configure
or broken package installations.

## Broken Packages

### 1. Perform dpkg Audit 

    sudo dpkg -C

If you find a problematic package try fixing it with APT

    sudo apt-get clean && sudo apt-get autoremove
    sudo apt-get -f install
    sudo dpkg --configure -a

If this fails due to the broken package state force remove it with dpkg

    dpkg -r <package>

If dpkg removing fails this is usually due to a failing pre-remove script.
In this case remove the failing script and retry `dpkg -r`

### 2. Check for half-configured packages

    dpkg -l | awk '/^iF/ {print $2}'

If you find half-configured packages run

    sudo dpkg-reconfigure <package>
