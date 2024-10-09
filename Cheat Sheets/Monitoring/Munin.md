## CLI

- Munin - Test Plugins:

        /usr/sbin/munin-run <plugin name> # for values
        /usr/sbin/munin-run <plugin name> config # for configuration

- Munin - Test available plugins]

        /usr/sbin/munin-node-configure --suggest

        # and enable them using
        /usr/sbin/munin-node-configure --shell | sh

- Munin Server - Manual Update Run:

        sudo -u munin /usr/bin/munin-cron
