---
related:
  cheat-sheet: ['Mcollective', 'Puppet - Hiera']
---

### Puppet CLI

- Bootstrap client

        puppet agent -t --server <puppet master> [<options>]

- Display facts:

        facter              # All system facts
        facter -p           # All system and Puppet facts
        facter -y           # YAML
        facter -j           # JSON

        facter [-p] <name>  # A specific fact

        # Examples
        facter memoryfree
        facter is_virtual processor0

- Injecting Facts:

      env FACTER_<fact name>=<fact value> puppet apply site.pp
     
-   Find out effective classes on a node

        cat /var/lib/puppet/classes.txt

-   Find out when which file was modified

        cd /var/lib/puppet
        for i in $(find clientbucket/ -name paths); do
            echo "$(stat -c %y $i | sed 's/\..*//')       $(cat $i)";
        done | sort -n

-   Puppet Dry Run:

        puppet agent --noop --verbose

-   Disable agent

        puppet agent --disable
        puppet agent --disable <info message>   # Only recent versions
        puppet agent --enable

-   Executing selective classes

        puppet agent --tags Some::Class

-   Managing Certificates (on master)

        puppet cert list
        puppet cert list --all
        puppet cert sign <name>
        puppet cert clean <name>   # removes cert

-   Managing Nodes

        puppet node clean <name>   # removes node + cert

-   Managing Modules

        puppet module list
        puppet module install <name>
        puppet module uninstall <name>
        puppet module upgrade <name>
        puppet module search <name>

-   Inspecting Resources/Types

        puppet describe -l
        puppet resource <type name>

        # Querying Examples
        puppet resource user john.smith
        puppet resource service apache
        puppet resource mount /data
        puppet resource file /etc/motd
        puppet resource package wget

        # Trigger puppet run from master
        puppet kick <name>
        puppet kick -p 5 <names>      # 5 parallel

-   Debugging deployment and rules on a local machine. This only makes
    sense in "one time" mode running in one of the following variants:

        puppetd --test # enable standard debugging options
        puppetd --debug # enable full debugging
        puppetd --one-time --detailed-exitcodes # Enable exit codes:
                   # 2=changes applied
                   # 4=failure

-   [Gepetto: Puppet
    IDE](http://puppetlabs.com/blog/geppetto-a-puppet-ide)
-   [puppet - Correctly using Roles and
    Profiles](http://www.craigdunn.org/2012/05/239/)

### Puppet 2/3 Master

Enable debugging: Add to /etc/puppet/rack/config.ru

    ARGV << "--debug"

and restart the Passenger.

### Puppet DSL

#### Snippets

    notify { 'message': loglevel => 'err' }

Check for file

    if file_exists('somefile.txt') == 1 { }

Execute commands (evil!)

    exec { "mkdir -p $dir":
        command => "/bin/mkdir -p $dir",
        creates => $dir
    }

#### Merging Arrays

    $result = split(inline_template("<%= (array1+array2).join(',') %>"),',')

#### Exceptions

    fail('This is a parser time error')

#### Conditions

    if $var == 'value' {
    }

    case $::lsbdistcodename {
        'squeeze': {
            }
            'wheezy', 'jessie': {
            }
            default {
            }
    }

### ERB Syntax

#### ERB Tags

    <%= ruby code, result inserted %>
    <% ruby code, result not inserted %>  # use for loops, conditions...
    <%- like above, but strips leading+trailings spaces from output -%>
    <%# comment %>

    <%%  # literal <%
    %%>  # literal %>

#### Using Variables

    <%= @name %>              # variable visible in current scope
    <%= scope.lookupvar('name') %>        # search in all scopes
    <%= scope['somewhere::name'] %>       # Puppet 3 scope access

#### Conditions

    <% if @name != nil %>
       Well, @name is set!

       When checking if a variable exists/is set 
       always do check for nil! Everything else is unsafe.
    <% end %>

    <% if @name ~ /.* Smith$/ %>
       Matches
    <% end %>

### Augeas

[Augeas - in
Puppet](http://projects.puppetlabs.com/projects/1/wiki/Puppet_Augeas):
Using Puppet with Augeas

    augeas { "sshd_config":
     changes => [
     "set /files/etc/ssh/sshd_config/PermitRootLogin no",
     ],
    }

### Testing

-   Validate manifest

        puppet parser validate <manifest>

-   Validate ERBs

        erb -x -T '-' <template> | ruby -c 

-   [puppet-rspec](http://rspec-puppet.com/): Testing Puppet modules
    with rspecs
-   [Beaker](https://github.com/puppetlabs/beaker/wiki/Overview): Puppet
    acceptance testing in VMs

### Misc

-   [Vim Autoformatting for
    Puppet](http://blog.netways.de/2012/10/30/puppet-und-vim/)
-   [Vim
    puppet-lint](https://blog.netways.de/2012/11/13/vim-puppet-lint-und-syntastic/)
-   [Atom Editor puppet-lint](https://atom.io/packages/atom-lint)

