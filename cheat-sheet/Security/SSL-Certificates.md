---
related:
  cheat-sheet: ['HTTPS', 'OpenSSL']
---

## Certbot Usage

Issue a letsencrypt certificate with subject alternate names via DNS challenge.
Ensure to pass the certificate domain as the first domain passed with `-d`!

    certbot certonly --manuel --preferred-challenges dns -d example.com,www.example.com,upload.example.com,img.example.com

## CA Management Solutions

- [EasyRSA](https://github.com/OpenVPN/easy-rsa) (CLI)
- [roCA](http://www.intrusion-lab.net/roca/) (USB stick based CA)
- [TinyCA](https://packages.debian.org/de/wheezy/tinyca) (GUI)
- [XCA](http://www.hohnstaedt.de/xca.html) (GUI)

## Pricing

-   [sslshopper.com](https://www.sslshopper.com): Price Comparison with
    different cert types
-   Free certificates:
    -   Cloudflare
    -   StartSSL
    -   [letsencrypt.org](https://letsencrypt.org/)

