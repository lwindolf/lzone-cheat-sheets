---
related:
  cheat-sheet: ['SSL-Certificates']
---

## OpenSSL Commands

- [OpenSSL Kurzreferenz](http://www.dfn-cert.de/informationen/themen/verschluesselung_und_pki/openssl-kurzreferenz.html):
  All commands to create keys, certificates and certificate requests.
- Print x509 Certificate Infos:

        openssl x509 -text -in my.pem
        openssl ca -text -in my_ca.pem
        openssl req -text -in csr.pem

- Print PKCS7 certificates

        openssl pkcs7 -in <file> -print_certs

- Export from PKCS12 (.pfx)

        openssl pkcs12 -info -in INFILE.p12 -nodes -nocerts    # Keys
        openssl pkcs12 -info -in INFILE.p12 -nokeys            # Certificates

- Checking Files

        openssl req -text -noout -verify -in csr.pem
        openssl rsa -in my.key -check
        openssl pkcs12 -info -in keystore.p12

- Check for expiration

        openssl x509 -enddate -noout -in file.pem            # prints something like 'notAfter=Nov  3 22:23:50 2014 GMT'
        openssl x509 -checkend 86400 -noout -in file.pem     # gives exitcode 0 if not expired

-   Testing SSL webserver

        openssl s_client -connect example.com:443

        # With advanced TLS and OSCP debugging:
        openssl s_client -connect example.com:443 -tls1 -tlsextdebug -status

-   OpenSSL Version and Certificates directory:

        openssl version -a

-   Rehash OpenSSL certificates

        c_rehash <directory>

-   Verifying certificates

        Certificate: openssl x509 -noout -modulus -in server.crt | openssl md5
        Private Key: openssl rsa -noout -modulus -in server.key | openssl md5
        CSR: openssl req -noout -modulus -in server.csr | openssl md5

-   Stripping password from private keys

        openssl rsa -in key-with-pwd.pem -out key-without-pwd.pem


