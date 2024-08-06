# Salt Cheatsheet

Salt (Infrastructure Management tool) can be used for data-driven orchestration, remote execution for any infrastructure, configuration management for any app stack, and much more.

See also
- [Salt Project](https://docs.saltproject.io/en/latest/)
- [Install and get started with Salt](https://docs.saltproject.io/en/latest/topics/installation/index.html)
- [salt Cheat Sheet](https://github.com/saltstack/salt/wiki/Cheat-Sheet)
- [saltstack Cheat Sheet](https://github.com/harkx/saltstack-cheatsheet)

# SaltStack commands

On Master:

    service salt-master restart
    
For Minion:

    service salt-minion restart
 
For Salt API:

    service salt-api restart
   

## Salt-master commands

    salt-run manage.status       # List minion connected to master
    salt-key --list all          # Listing minions keys
    salt-key -A                  # Accept all minions keys, y to force validation
    salt-key -D                  # Delete all minions key
    salt-key -a <minionID>       # Accept one of minions
    
    salt 'scribe.ac-test.fr' test.ping     # Ping one of minions
    salt '*' test.ping                     # Ping all minions
    salt "*" cmd.run 'reboot'              # Run OS command on minion
    salt-call sys.list_modules --out=json  # Listing modules
    salt-call sys.list_state_modules       # Listing states

