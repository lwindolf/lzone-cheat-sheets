---
meta:
  RFC: https://tools.ietf.org/html/rfc6762
  network:
    port: 5353
    proto: UDP
    IPv4: 224.0.0.251
    IPv6: ff02::fb
links:
- url: https://de.wikibrief.org/wiki/Multicast_DNS
- url: 
---

## Avahi Discovery

    avahi-browse -v -t -r --all
    avahi-browse -rt _ipp._tcp
    avahi-browse -rt _uscan._tcp
    driverless
    
## nsswitch.conf

In `/etc/nsswitch.conf` you can use `mdns4` and `mdns4_minimal` with the latter only resolving `.local` addresses.

Typical configuration:

    hosts: files mdns4_minimal [NOTFOUND=return] dns

To resolve non-local mDNS also:

    hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4
