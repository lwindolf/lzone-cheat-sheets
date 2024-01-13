## Commands

Use `pip` when working with Python2 and `pip3` when working with Python3.

    apt-get install python-pip  # Python 2.x
    apt-get install python-pip3 # Python 3.x

Note: commands are given for `pip3` but will work for `pip` also!

    pip3 install <module>
    pip3 install --upgrade <module>
    pip3 uninstall <module>
    
    pip3 freeze                       # Prints all versions
    pip3 freeze >requirements.txt     # Create a requirements.txt
    
    pip3 install -r requirements.txt  # Install from a requirements.txt

## Private Registry

    cat <<EOT >/etc/pip.conf
    [global]
    index = https://${user}:${pwd}@${host}/some/repo/path/
    index-url = https://${user}:${pwd}@${host}/some/repo/path
    EOT

Note: pip.conf is read by both Python2 pip and Python3 pip3
