---
related:
  cheat-sheet: ['Ansible', 'Chef', 'Puppet']
---

## Classical Automation Tools

| Framework | DSL | Push/Pull | CM | CM Encryption | Drift Management |Job Scheduling | Orchestration |
|-----------|-----|-----------|----|---------------|------------------|---------------|---------------|
|[Ansible](http://www.ansible.com/home)|Propietary|Push|Built-in|Built-in|?|Ansible Tower|Ansible Tower|
|[cfengine](https://cfengine.com/)|Propietary|Push/Pull|?|?|?|Enterprise Only|?|
|[Puppet](http://puppetlabs.com/)|Ruby|Push/Pull|[Hiera](https://docs.puppetlabs.com/hiera/1/)|[Hiera Eyaml](https://github.com/TomPoulton/hiera-eyaml)|Foreman, PuppetDB, Polscan|Puppet Enterprise|Puppet Enterprise, [mcollective](http://puppetlabs.com/mcollective)|
|[Chef](https://opscode.com)|Ruby|Push/Pull|[Builtin](https://docs.getchef.com/essentials_data_bags.html)|[Builtin](https://docs.getchef.com/essentials_data_bags.html#encrypt-a-data-bag-item)|-|[Pushy](https://www.getchef.com/blog/2013/12/16/getting-pushy-with-chef/), (knife plugin + ZeroMQ)|%|
|[Saltstack](http://www.saltstack.com/community/)|Python|Push|Builtin|Builtin|?|[salt-run](https://docs.saltstack.com/en/latest/topics/orchestrate/orchestrate_runner.html#orchestrate-runner)|Saltstack Enterprise|

### Smaller automation tools

-   [Bcfg2](http://trac.mcs.anl.gov/projects/bcfg2/): Alternative to
    puppet and cfengine by Argonne National Laboratory. (IMO out-dated)
-   [cdist](http://www.nico.schottelius.org/software/cdist/):
    configuration with shell scripting
-   [EMC
    UIM](http://www.emc.com/data-center-management/unified-infrastructure-manager.htm)
    - Unified Infrastructure Manager, VCE VBlock (enterprise,
    commercial)
-   [slaughter](http://www.steve.org.uk/Software/slaughter/) (Perl,
    active, small user base)
-   [Sprinkle](https://github.com/crafterm/sprinkle) (Ruby, quite
    recent)
-   [Rundeck](http://rundeck.org) - Workflow manager for node - role
    systems like EC2, chef, puppet ...
-   [IBM
    Tivoli](http://www-03.ibm.com/software/products/en/serviceautomationmanager)

Finally it is worth to check the [Wikipedia Comparison
Chart](http://en.wikipedia.org/wiki/Comparison_of_open_source_configuration_management_software)
for other less known and new tools!

## Automation Drift Management

- [ScriptRock Guard](https://www.scriptrock.com/)
- for Puppet
   - PuppetDB
   - Foreman
   - [Debian Policy Scanner](https://github.com/lwindolf/polscan)

## Testing

- [ServerSpec](https://serverspec.org/): RSpec for server configurations

## Misc

-   [Augeas](http://delicious.com/redirect?url=http%3A//packages.debian.org/wheezy/augeas-tools):
    Very flexible file editor to be used with Puppet or standalone.
    Could also work with cfengine.

        $ augtool
        augtool> set /files/etc/ssh/sshd_config/PermitRootLogin no
        augtool> save

-   cfengine - Force running shortly after a recent execution

        cfagent -K

-   [cfengine - Design
    Center](http://cfengine.com/cfengine-design-center): Git repository
    with sketches and examples for cfengine.
-   cfengine - Find and install sketches from the Design Center
    repository

        # cf-sketch --search utilities
        Monitoring::nagios_plugin_agent /tmp/design-center/sketches/utilities/nagios_plugin_agent
        [...]
        # cf-sketch --install Monitoring::nagios_plugin_agent

-   SaltStack - Run commands

        salt '*' cmd.run 'apt-get install bash'

-   SaltStack - Batch concurrency

        salt '*' state.highstate -b <count>

-   [osquery - Facebook SQL facter](https://github.com/facebook/osquery)

        echo "SELECT * FROM etc_hosts;" | osqueryi

        $ osqueryi
        osquery> SELECT
            ...> u.username,
            ...> g.groupname
            ...> FROM users as u
            ...> JOIN groups as g ON u.gid = g.gid;


