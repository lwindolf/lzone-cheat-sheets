This runbook gives hint on how to interpret system log errors.

## Hardware Problems

### ACPI Errors

ACPI errors be them on laptops or servers are usually irrelevant and just indicate the bad ACPI standard compliance and support from vendors. Ignore them.

### blk_update_request: I/O error, dev sda, sector xxxx

Your disk is failing and needs replacement.

### \[Hardware Error]: error_type: 2, single-bit ECC

Your RAM modules might be faulty.

### Hardware event. This is not a software error.

Indicates a hardware problem. You might want to check HW status with `ipmitool`, `mcelog` or `rasdaemon` on the machine or in your ILO / ILOM / IDRAC GUI.

## Buffer I/O error on device md0

Probably a RAID problem. Check physical devices with `smartctl`

## ADDRCONF(NETDEV_UP): bond0: link is not ready

Check bond with `nmcli`
