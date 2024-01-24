---
related:
  cheat-sheet: ['Package Vulnerabilities', 'auditd', 'OpenSCAP']
---

## Threat Modelling

- [Microsoft Stride](https://docs.microsoft.com/de-de/azure/security/develop/threat-modeling-tool-getting-started) 
- [Threat Dragon (Editor)](http://docs.threatdragon.org/threat-generation/)

## Server Scanners

-   CIS CAT Pro Assessor (commercial)
-   CIS CAT Pro Lite (more or less free)
-   Nessus (commercial)
-   [OpenVAS - Security Scanner](https://www.openvas.org/index.html)
    (more or less free)
-   [Sguil](https://bammv.github.io/sguil/index.html) (commercial)
-   SCAP
    -   [SCAP Guidelines](https://fedorahosted.org/scap-security-guide/)
    -   [Open SCAP - Scanner for NIST SCAP](https://open-scap.org/page/Main_Page)
    -   [NSA SIMP - SCAP scanner + Puppet
        modules](https://github.com/NationalSecurityAgency/SIMP)
-   [Tiger](https://savannah.nongnu.org/projects/tiger/) - Unix auditing
    tool
-   [Lynis](https://cisofy.com/lynis/) - Linux auditing solution (free,
    with enterprise support)
-   File Checksum Tools
    -   rkhunter
    -   Tripwire
-   auditd
-   [Detecting Linux Kernel Rootkits](https://la-samhna.de/library/rootkits/detect.html)

## Website Scanners

See [HTTPS](/cheat-sheet/HTTPS) for HTTPS configuration and certificate checkers.

- Nessus (commercial)
- [Nmap NSE scripts](https://nmap.org/nsedoc/)
- [Sucuri - Website Malware Scan](https://sitecheck.sucuri.net/)
- [unmaskparasites.com - Site scanner](https://www.unmaskparasites.com/)
- [Wordpress Vulnerability Scanner](https://wpscan.org/)
- [https://www.netsparker.com/](https://www.netsparker.com/)
- [GDPR Scanner](https://www.immuniweb.com/websec/)

## Standards and Guides

- [NIST XCCDF Format](https://scap.nist.gov/specifications/xccdf/)
- [PCI DSS Standards Documents](https://www.pcisecuritystandards.org/security_standards/documents.php)
- [chroot Best Practices](http://www.unixwiz.net/techtips/chroot-practices.html)
- [CCE List](https://cce.mitre.org/lists/cce_list.html) - Common Configuration Enumerations
- [TCP/IP Stack Hardening](https://cromwell-intl.com/cybersecurity/stack-hardening.html): Unix network hardening
- [ArchLinux TCP/IP Stack hardening](https://wiki.archlinux.org/index.php/Sysctl#TCP.2FIP_stack_hardening)
- [ArchLinux Kernel hardening](https://wiki.archlinux.org/index.php/Security#Kernel_hardening)
- [Linux Foundation: Workstation hardening](https://github.com/lfit/itpol/blob/master/linux-workstation-security.md)

## OpenVAS

### Setup

Create initial GUI user for Debian OpenVAS

    # openvasmd --create-user admin
    User created with password '3e1e7f50-1bc3-4f38-9d48-2ac410dd37cf'.

### Updating

    openvas-nvt-sync
    openvas-scapdata-sync
    openvas-certdata-sync

## Threat Sharing

- [MISP](https://www.misp-project.org/features.html)


