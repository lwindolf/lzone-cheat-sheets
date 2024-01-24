This is a cheat sheet for the unbound DNS resolver.

## Admin 

     unbound-anchor -a /var/lib/unbound/root.key         # Update root anchors for DNSSEC
     unbound-anchor -a /var/lib/unbound/root.key -4      # Workaround IPv6 bug in some versions
     unbound -c /etc/unbound/unbound.conf

     unbound-control reload         # Reapply config
     unbound-checkconf              # Check config
     
Downloading root hints 

     wget https://www.internic.net/domain/named.root -O /etc/unbound/root.hints
     
## Forward Config

    forward-zone:
      name: "."
      forward-addr: 8.8.4.4
      forward-addr: 8.8.8.8

## Stub Zones

    stub-zone:
            name: "<name>"
            stub-addr: <ip>
            stub-first: yes

## Local Zones

Simple local records are to be defined under `server`

    server:
      local-data: "health.check.unbound A 10.10.10.10"
      local-data-ptr: "10.10.10.10 health.check.unbound"

Local zones are defined like this

    server:
      local-zone: "myzone.local"    
      local-data: “jupiter.myzone”   IN A    10.0.0.5

Insecure local zone (no DNSSEC)

      domain-insecure: "myzone.local"
