---
related:
  cheat-sheet: ['NFS', 'SSH', 'netfilter', 'iptables', 'tcpdump', 'curl']
---

## Basics

### netcat Commands

      nc -l -p <port>       # Listen on port
      nc -w3 <ip> <port>  # Listen for connection from IP on port

      # Search banners
      echo | nc -v -n -w1 <ip> <port min>-<port max>

      # Port scan
      nc –v –n –z –w1 <ip> <port min>-<port max>
      
      # Perform request
      printf 'HTTP/1.0 GET /\n'  | nc <server> <port>
      
      # Simple echo server
      while true ; do nc -l -p 8080 -c 'echo -e "HTTP/1.1 200 OK\n\n $(date)"'; done

### Disable IPv6

      echo 1 > /proc/sys/net/ipv6/conf/default/disable_ipv6
      echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6

See also: [packetlife.net cheetsheets](http://packetlife.net/library/cheat-sheets/) for all network protocols (PDFs)

## DNS

- Resolve own IP

        dig +short myip.opendns.com @resolver1.opendns.com
        curl ifconfig.me

- Resolve a name via nsswitch

        getent hosts <host name>

- [CloudShark](http://www.cloudshark.org): Sharing network traces
- DNS Lookup

        dig <domain>
        dig <domain> +noall +answer
        dig <domain> +short
        dig MX <domain>
        dig NS <domain>
        dig ANY <domain>

        dig -x <IP>
        dig -x <IP> +short

        dig @8.8.8.8 <domain>

        dig -f input.txt +noall +answer

- DNS RR - warpsrv: CLI wrapper for DNS RR connections

        apt-get install -y wrapsrv netcat
        export eval $(wrapsrv <DNS name> "netcat -z %h %p && echo http_proxy=http://%h:%p")

- [DNSSEC - Verisign Online Tester](https://dnssec-debugger.verisignlabs.com/)
- DNS - [CAA Support](https://sslmate.com/caa/support): Providers and Tools

* DNS server
  * Bind
  * PowerDNS
  * NSD
  * ldns
  * unbound

* DNS over TLS/HTTPS resolvers
  * [stubby](https://dnsprivacy.org/wiki/display/DP/DNS+Privacy+Daemon+-+Stubby)
  * [cloudflared](https://developers.cloudflare.com/1.1.1.1/dns-over-https/cloudflared-proxy/)
  * [nss-tls](https://github.com/dimkr/nss-tls)

* Public DNS over TLS/HTTPS resolvers
  * Google (8.8.8.8:853)
  * Cloudflare (1.1.1.1:853)
  * Quad9 (9.9.9.9:853)
  * Also see https://dnsprivacy.org/wiki/display/DP/DNS+Privacy+Test+Servers

## Configuration

-   ethtool - Usage

        ethtool eth0                       # Print general info on eth0
        ethtool -i eth0                    # Print kernel module info
        ethtool -S eth0                    # Print eth0 traffic statistics
        ethtool -a eth0                    # Print RX, TX and auto-negotiation settings
        ethtool -p eth0                    # Blink LED

        # Changing NIC settings...
        ethtool -s eth0 speed 100
        ethtool -s eth0 autoneg off
        ethtool -s eth0 duplex full
        ethtool -s eth0 wol g               # Turn on wake-on-LAN

    Do not forget to make changes permanent in e.g.
    /etc/network/interfaces.

-   ip - Usage

        ip link show
        ip link set eth0 up
        ip addr show
        ip neigh show

-   miitool - Show Link Infos

        # mii-tool -v
        eth0: negotiated 100baseTx-FD flow-control, link ok
          product info: vendor 00:07:32, model 17 rev 4
          basic mode:   autonegotiation enabled
          basic status: autonegotiation complete, link ok
          capabilities: 1000baseT-HD 1000baseT-FD 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
          advertising:  100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD flow-control
          link partner: 1000baseT-HD 1000baseT-FD 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD flow-control

-   Enable Jumbo Frames

        ifconfig eth1 mtu 9000
        
- Allow binding IP that does not exist

        sysctl -w net.ipv4.ip_nonlocal_bind=1

- [NFS - Tuning Secrets](https://speakerdeck.com/gnb/130-lca2008-nfs-tuning-secrets-d7):
    SGI Slides on NFS Performance

## Troubleshooting

- Black Hole Route: To block IPs create route on loopback

        route add -net 91.65.16.0/24 gw 127.0.0.1 lo   # for a subnet
        route add  91.65.16.4 gw 127.0.0.1 lo   # for a single IP

- Quick Access Log IP Top List

        tail -100000 access.log | awk '{print $1}' | sort | uniq -c |sort -nr|head -25

- Find out if IP is used before configuring it

        arping <IP>

- Traceroute with AS and network name lookup

        lft -AN www.google.de

- [dailychanges.com](http://www.dailychanges.com/): Tracks DNS changes
- [Tuning network settings](https://russ.garrett.co.uk/2009/01/01/linux-kernel-tuning/)
- [Tracing using ad-hoc network namespace](https://askubuntu.com/questions/11709/how-can-i-capture-network-traffic-of-a-single-process/499850#499850)

## Measuring

-   vnstat - Short term measurement bytes/packets min/avg/max:

        vnstat -l      # Live listing until Ctrl-C and summary
        vnstat -tr     # 5s automatic traffic sample

-   vnstat - Long term statistics:

        vnstat -h      # last hours (including ASCII graph)
        vnstat -d      # last days
        vnstat -w      # last weeks
        vnstat -m     # last months

        vnstat -t       # top 10 days

### Benchmarks

- iperf3
- [nuttcp](http://nuttcp.net/Welcome%20Page.html)
- [Ethr](https://github.com/Microsoft/ethr)

## Discovery

-   LLDP

        lldpctl
        lldpctl eth0

-   nmap commands

        # Network scan
        nmap -sP 192.168.0.0/24

        # Host scan
        nmap <ip>
        nmap -F <ip>      # fast
        nmap -O <ip>     # detect OS
        nmap -sV <ip>     # detect services and versions
        nmap -sU <ip>     # detect UDP services

        # Alternative host discovery
        nmap -PS <ip>     # TCP SYN scan
        nmap -PA <ip>     # TCP ACK scan
        nmap -PO <ip>     # IP ping
        nmap -PU <ip>     # UDP ping

        # Alternative service discovery
        nmap -sS <ip>      
        nmap -sT <ip>
        nmap -sA <ip>
        nmap -sW <ip>

        # Checking firewalls
        nmap -sN <ip>
        nmap -sF <ip>
        nmap -sX <ip>

## Changing Capabilities

Allow user started daemon binding on ports <1024

    setcap cap_net_bind_service=+ep <binary>
    
Check with

    getcap <binary>

## Debugging

-   [X-Trace - Multi-protocol tracing
    framework](http://x-trace.net/pubs/nsdi-html/xtrace.html)
-   iptraf - Real-time statistics in ncurses interfaces
-   mtr - Debug routing/package loss issues

        mtr --report <host>                     # ping based
        mtr --report --tcp --port 443 <host>    # connection based

-   netstat - The different modes

        # Typically used modes
        netstat -rn          # List routes
        netstat -tlnp       # List all open TCP connections
        netstat -tlnpc      # Continuously do the above
        netstat -tulpen    # Extended connection view
        netstat -a           # List all sockets

        # And more rarely used
        netstat -s            # List per protocol statistics
        netstat -su          # List UDP statistics
        netstat -M           # List masqueraded connections
        netstat -i            # List interfaces and counters
        netstat -o           # Watch time/wait handling

-   nttcp - TCP performance testing

        # On sending host
        nttcp -t -s

        # On receiving host
        nttcp -r -s

-   List Kernel Settings

        sysctl net

-   [SNMP - Dump all
    MIBs](http://net-snmp.sourceforge.net/wiki/index.php/TUT:snmpwalk):
    When you need to find the MIB for an object known only by name try

        snmpwalk -c public -v 1 -O s <myhost> .iso | grep <search string>

-   [Hurricane Electric - BGP Tools](http://bgp.he.net/): Statistics on
    all AS as well as links to their looking glasses.
-   [darkstat](https://unix4lyfe.org/darkstat/) - libpcap monitoring

