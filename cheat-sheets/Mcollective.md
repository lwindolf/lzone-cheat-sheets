### Finding Hosts

    mco ping
    mco ping -W "/some match pattern/"
    mco ping -S "<some select query>"

    mco find                                 # List all hosts known

### Finding Groups of Hosts

Simple facts can be matched with -F

    mco find -F ipaddress=192.168.1.1
    mco find -F kernel_version=/3.4/ -F fqdn=/db/

Structured facts (introduced with facter 2) can only be matched with -S
like this

    mco find -S 'fact("networking.network").value=192.168.5.0'
    mco find -S 'fact("os.distro.codename").value=jessie'

### Fact Histograms

To get the distribution of all fact values:

    mco facts timezone

### Plugin Commands

    # List agents, queries, plugins...
    mco plugin doc
    mco plugin doc <name>

    # Puppet runs
    mco puppetd status
    mco puppetd status -I <host>
    mco puppetd runonce -I <host>
    mco puppetd <enable|disable> -I <host>

    mco rpc puppetd status -F <fact>=<value>
    mco rpc puppetd runonce -F <fact>=<value>
    mco rpc puppetd runonce -W /pattern/

    mco rpc service start service=httpd
    mco rpc service stop service=httpd

    mco facts <keyword>
    mco inventory --lco     # List collectives
    mco inventory <node name>
    mco rpc rpcutil inventory -I <node name>
    mco rpc rpcutil get_fact fact=<fact name>

### Remote Command Execution

With Puppet RAL

    mco rpc puppetral -F <filter> create type=exec title="/bin/bash -c 'echo Hallo'"
    mco rpc puppetral --batch 5 --batch-sleep 10 create type=package title="htop"

(Note: when using RAL do not combine --limit with --batch as --batch
would be ignored!)

With shell plugin installed

    mco shell run <command>
    mco shell run --tail <command>

    mco shell start <command>    # Returns an id
    mco shell watch <id>
    mco shell kill <id>
    mco shell list

### Formatted Reports

Formatting can be achieved using inventory scripts. General syntax:

    mco inventory [<some filter>] --script <mco script>

Example

    mco inventory -F fqdn=/db/ --script <(echo "
    inventory do
      format '%s %s'
      fields { [ identity, facts['operatingsystemrelease'] ] }
    end
    ")

### Ansible like Playbooks

YAML playbooks can be done with [Choria](http://choria.io/docs/about/).
