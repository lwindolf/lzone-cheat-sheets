See Also: <?add topic='Package Vulnerabilities'?>

### Server Scanners

-   Nessus (commercial)
-   [OpenVAS - Security Scanner](http://www.openvas.org/index.html)
    (more or less free)
-   [Sguil](http://bammv.github.io/sguil/index.html) (commercial)
-   SCAP
    -   [SCAP Guidelines](https://fedorahosted.org/scap-security-guide/)
    -   [Open SCAP - Scanner for NIST
        SCAP](http://open-scap.org/page/Main_Page)
    -   [NSA SIMP - SCAP scanner + Puppet
        modules](https://github.com/NationalSecurityAgency/SIMP)
-   [Tiger](http://savannah.nongnu.org/projects/tiger/) - Unix auditing
    tool
-   [Lynis](https://cisofy.com/lynis/) - Linux auditing solution (free,
    with enterprise support)
-   File Checksum Tools
    -   rkhunter
    -   Tripwire
-   auditd

        auditctl -a always,exit -F arch=b64 -F pid=<pid> -S open -k <trace name>
        ausearch -k <trace name>

-   [Detecting Linux Kernel
    Rootkits](http://la-samhna.de/library/rootkits/detect.html)

### Website Scanners

See <?add topic='HTTPS'?> for HTTPS configuration and certificate checkers.

-   Nessus (commercial)
-   [Nmap NSE scripts](https://nmap.org/nsedoc/)
-   [Sucuri - Website Malware Scan](https://sitecheck.sucuri.net/)
-   [unmaskparasites.com - Site
    scanner](http://www.unmaskparasites.com/)
-   [Wordpress Vulnerability Scanner](http://wpscan.org/)
-   [https://www.netsparker.com/](https://www.netsparker.com/)

### Standards and Guides

-   [NIST XCCDF Format](http://scap.nist.gov/specifications/xccdf/)
-   [PCI DSS Standards
    Documents](https://www.pcisecuritystandards.org/security_standards/documents.php)
-   [chroot Best
    Practices](http://www.unixwiz.net/techtips/chroot-practices.html)
-   [CCE List](http://cce.mitre.org/lists/cce_list.html) - Common
    Configuration Enumerations
-   [TCP/IP Stack
    Hardening](http://cromwell-intl.com/security/security-stack-hardening.html):
    Unix network hardening
-   [ArchLinux TCP/IP Stack
    hardening](https://wiki.archlinux.org/index.php/Sysctl#TCP.2FIP_stack_hardening)
-   [ArchLinux Kernel
    hardening](https://wiki.archlinux.org/index.php/Security#Kernel_hardening)
-   [Linux Foundation: Workstation
    hardening](https://github.com/lfit/itpol/blob/master/linux-workstation-security.md)
-   [mkpasswd - Create Passwords](http://lzone.de/node/20)

### OpenVAS

#### Setup

Create initial GUI user for Debian OpenVAS

    # openvasmd --create-user admin
    User created with password '3e1e7f50-1bc3-4f38-9d48-2ac410dd37cf'.

#### Updating

    openvas-nvt-sync
    openvas-scapdata-sync
    openvas-certdata-sync

 

### Threat Sharing

-   MISP: http://www.misp-project.org/features.html

