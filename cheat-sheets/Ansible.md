### Playbooks

    ansible-playbook <YAML>                   # Run on all hosts defined
    ansible-playbook <YAML> -f 10             # Run 10 hosts parallel
    ansible-playbook <YAML> --verbose         # Verbose on successful tasks
    ansible-playbook <YAML> -C                # Test run
    ansible-playbook <YAML> -C -D             # Dry run
    ansible-playbook <YAML> -l <host>         # Run on single host

Run Infos

    ansible-playbook &lt;YAML&gt; --list-hosts
    ansible-playbook &lt;YAML&gt; --list-tasks

Syntax Check

    ansible-playbook --syntax-check &lt;YAML&gt;

### Remote Execution

    ansible all -m ping

Execute arbitrary commands

    ansible <hostgroup> -a <command>
    ansible all -a "ifconfig -a"

### Debugging

List facts and state of a host

    ansible <host> -m setup
    ansible <host> -m setup -a &#39;filter=ansible_eth*&#39;

