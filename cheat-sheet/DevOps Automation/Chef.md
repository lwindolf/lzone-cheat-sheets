### General

#### Chef Dry Run

    chef-client -Fmin --why-run

#### List Facts

    ohai

#### Bootstrap Chef client

    knife bootstrap <FQDN/IP>

#### Change Chef Run List

    knife node run_list <add|remove> <node> <cookbook>::<recipe>

#### Runlist Status

    knife status --run-list
    knife status "role:webserver" --run-list

### Nodes and Roles

#### List Node Info

    knife node show <node>

#### List Nodes per Role

    knife search node 'roles:<role name>'

#### Load role from file

    knife role from file <file> [<file> [...]]

### Data Bags

#### Load data bag from file

    knife data bag from file <data bag name> <file>

### knife + SSH

    knife ssh -a ipaddress name:server1 "chef-client"

you can also use patterns:

    knife ssh -a ipaddress name:www* "uptime"

### Debugging

#### Inheritance

[Debugging Attribute
Inheritance](http://lzone.de/Chef-How-To-Debug-Active-Attributes)

    # Invoke chef shell in attribute mode
    chef-shell -z
    chef > attributes
    chef:attributes >

    # Query attributes examples
    chef:attributes > default["authorized_keys"]
    [...]
    chef:attributes > node["packages"]
    [...]

### [Editing Files](http://lzone.de/Chef+Recipe+for+Editing+Config+Files)

using a Script resource.

    bash "some_commands" do
        user "root"
        cwd "/tmp"
        code <<-EOT
           echo "alias rm='rm -i'" >> /root/.bashrc
        EOT
    end

### Misc

-   [Hardening
    cookbook](https://github.com/hardening-io/chef-os-hardening)
-   [Drift Detection Cookbook](https://github.com/stathy/drift_tracking)
-   [Fix RabbitMQ 100% CPU
    usage](http://lzone.de/Solving+100%25+CPU+usage+of+Chef)
-   [Exporting Nagios
    Hostgroups](http://lzone.de/Simple-Chef-to-Nagios-Hostgroup-Export)
-   [Chef - Manage Amazon EC2
    instances](http://gerhardlazu.com/2010/08/using-chef-to-manage-amazon-ec2-instances-part1/)
-   [Chef - Tutorial on how to Setup Nagios in
    EC2](http://wiki.opscode.com/display/chef/Nagios+Quick+Start)
-   Chef Enterprise - Push Jobs (using the [Push
    Cookbook](https://github.com/opscode-cookbooks/push-jobs))

        knife job start ...
        knife job list

        knife node status ...


