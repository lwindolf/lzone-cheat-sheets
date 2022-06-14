## Playbooks

    ansible-playbook <YAML>                   # Run on all hosts defined
    ansible-playbook <YAML> -f 10             # Run 10 hosts parallel
    ansible-playbook <YAML> --verbose         # Verbose on successful tasks
    ansible-playbook <YAML> -C                # Test run
    ansible-playbook <YAML> -C -D             # Dry run
    ansible-playbook <YAML> -l <host>         # Run on single host

Run Infos

    ansible-playbook <YAML> --list-hosts
    ansible-playbook <YAML> --list-tasks

Syntax Check

    ansible-playbook --syntax-check <YAML>

## Remote Execution

    ansible all -m ping

Execute arbitrary commands

    ansible <hostgroup> -a <command>
    ansible all -a "ifconfig -a"

## Debugging

List facts and state of a host

    ansible <host> -m setup                            # All facts for one host
    ansible <host> -m setup -a 'filter=ansible_eth*'   # Only ansible fact for one host
    ansible all -m setup -a 'filter=facter_*'          # Only facter facts but for all hosts

Save facts to per-host files in /tmp/facts

    ansible all -m setup --tree /tmp/facts

<?speakerdeck,dacfbe2fca344ffda3b93a5abcd155c7,Introduction to Ansible?>

## Ansible Module

Ansible modules are standalone scripts that can be used inside an Ansible playbook. You can use these modules to run whatever commands it needs to get its job done.

Ansible modules are categorized into various groups based on their functionality. There are hundreds of Ansible modules are available. You should read [Ansible Module](https://linuxbuz.com/linuxhowto/what-is-ansible-modules-and-how-to-use-it) for detail information of each module.

## Capture shell output

      tasks:
      - name: some shell
        register: sh_out
        ignore_errors: yes
        become_user: root
        shell: |
          find /

      - name: "Print stdout"
        debug:
          msg: "{{ sh_out.stdout.split('\n') }}"
      - name: "Print stderr"
        debug:
          msg: "{{ sh_out.stderr.split('\n') }}"

## Handling files

    tasks:
    - name: file operation
      file:
         path: <file path>
         state: file
         
         # optional attributes examples
         mode: '0755'                
         owner: <owner>            
         group: <group>              
         modification_time: now                                                
         access_time: '{{ "%Y%m%d%H%M.%S" | strftime(stat_var.stat.atime) }}'
         
## Handling directories

    tasks:
    - name: Change directory
      file:
        path: <dir path>
        state: directory
        
        # optional attributes
        recurse: yes              # apply owner, group, mtime, atime, mode... recursively to all childs too
        
        <further attributes like given for files above!>
 
## Deleting files & directories

    tasks:
    - name: rm
      file:
        path: <some path>
        state: absent
        recurse: yes        # optional
