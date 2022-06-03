---
related:
   cheat-sheet: ['netfilter']
---

## iptables Examples

-   [ipsets vs. iptables
    Performance](http://daemonkeeper.net/781/mass-blocking-ip-addresses-with-ipset/)
-   [ipsets - Using IP sets for simpler iptables
    rules](http://utcc.utoronto.ca/~cks/space/blog/linux/IptablesIpsetNotes)

        ipset create smtpblocks hash:net counters
        ipset add smtpblocks 27.112.32.0/19
        ipset add smtpblocks 204.8.87.0/24
        iptables -A INPUT -p tcp --dport 25 -m set --match-set smtpblocks src -j DROP

-   iptables - Loopback Routing:

        iptables -t nat -A POSTROUTING -d <internal web server IP> -s <internal network address> -p tcp --dport 80 -j SNAT --to-source <external web server IP>

-   iptables - Show active rules:

        iptables -S
        iptables -L 
        iptables -L <table>

-   iptables - Full flush:

        iptables -F
        iptables -X
        iptables -t nat -F
        iptables -t nat -X
        iptables -t mangle -F
        iptables -t mangle -X
        iptables -P INPUT ACCEPT
        iptables -P FORWARD ACCEPT
        iptables -P OUTPUT ACCEPT

-   iptables - Allow established:

        iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

-   iptables - Log failed requests:

        iptables -I INPUT 5 -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

-   iptables - Persistency on Debian:

        apt-get install iptables-persistent

        # Set some rules and call
        invoke-rc.d iptables-persistent save

-   [iptables - Persistency on Ubuntu:
    UFW](https://wiki.ubuntu.com/UncomplicatedFirewall) (Uncomplicated
    FireWall)

        ufw enable
        ufw status
        ufw allow ssh/tcp
        ufw allow from <IP> proto tcp to any port <port>
        ufw delete allow from <IP> proto tcp to any port <port>

-   fail2ban CLI Commands

        fail2ban-client status
        fail2ban-client status <jail name>

