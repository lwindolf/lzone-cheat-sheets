---
related:
  cheat-sheet: ['SSL-Certificates', 'OpenSSL']
---

### Perfect Forward Secrecy (PFS)

-   [HTTPS - Perfect Forward Secrecy (PFS)](http://www.heise.de/security/artikel/Zukunftssicher-Verschluesseln-mit-Perfect-Forward-Secrecy-1923800.html):
    Use

            TLS_ECDHE_RSA_WITH_RC4_128_SHA
            TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA
            TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
            TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA 

-   [Configure Forward Secrecy](https://community.qualys.com/blogs/securitylabs/2013/08/05/configuring-apache-nginx-and-openssl-for-forward-secrecy):
    HowTo for Apache, nginx and OpenSSL

### Public Key Pinning (HPKP)

-   [HPKP - HTTP Public Key Pinning](https://raymii.org/s/articles/HTTP_Public_Key_Pinning_Extension_HPKP.html):
    Headers look like

        Public-Key-Pins-Report-Only

        Public-Key-Pins pin-<algorithm>="<hash>"; pin-<algorithm>="<hash>"; max-age=<age>[; includeSubdomains]

-   [Creating SPKI fingerprints](https://raymii.org/s/articles/HTTP_Public_Key_Pinning_Extension_HPKP.html)

        openssl x509 -noout -in certificate.pem -pubkey | \
        openssl asn1parse -noout -inform pem -out public.key;
        openssl dgst -sha256 -binary public.key | openssl enc -base64

### OSCP

-   [Cloudflare: OSCP Stapling](https://blog.cloudflare.com/ocsp-stapling-how-cloudflare-just-made-ssl-30/)
-   [OCSP Stapling with nginx](https://raymii.org/s/tutorials/OCSP_Stapling_on_nginx.html)

### HTTPS Testing

-   [HTTPS Client Test](https://www.howsmyssl.com) (online)
-   [HTTPS Server Test](https://www.ssllabs.com/ssltest) (online)
-   [HTTPS Server Test](https://testssl.sh/) shell script

### SSL Performance

-   [SSL Overclocking](https://www.imperialviolet.org/2010/06/25/overclocking-ssl.html)
-   [SSL Performance Case Study Cloudflare](https://insouciant.org/tech/ssl-performance-case-study/)

