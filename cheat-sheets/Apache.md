See also: <?add topic='htaccess'?> <?add topic='HTTPS'?>

## Misc

-   [Apache vs. Lighttpd Rewrite Rules](/articles/rewrite-migrate.htm):
    How to migrate.
-   List VHost Precedence

        apache2ctl -S

-   List active modules

        apache2ctl -M

-   Rewrite on File Pattern

        RewriteCond %{REQUEST_FILENAME} (.*)\.(html|htm)$

-   Rewrite on User Agent

        RewriteCond %{HTTP_USER_AGENT} (iPhone|iPad)

-   Rewrite and add environment variable to request (for example pass along remote user)

        RewriteRule .* - [E=PROXY_USER:%{LA-U:REMOTE_USER}]

- [Injecting cookies with RewriteRule and CO flag](https://wiki.apache.org/httpd/RewriteFlags/CO) 
- [Get X-Forwarded-For IPs in log](http://www.loadbalancer.org/blog/apache-and-x-forwarded-for-headers/)

      # Define a LogFormat printing X-Forwaded-For IPs
      LogFormat "%{X-Forwarded-For}i %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" proxy
      
      # Check if the header is set to an IP
      SetEnvIf X-Forwarded-For "^.*\..*\..*\..*" forwarded
      
      # Depending on the check flag 'forwarded' switch between standard and XFF LogFormat
      CustomLog "logs/access_log" combined env=!forwarded
      CustomLog "logs/access_log" proxy env=forwarded

-   [Exception
    Hook](http://people.apache.org/~trawick/exception_hook.html): Since
    2.0.49 Apache has an exception hook to handle crashes.

        EnableExceptionHook on

-   htaccess doesn't work:

        AllowOverride All

-   environment variables via .htaccess:

        SetEnv VARNAME somevalue
        

### Authentication

-   Skip authentication for certain URIs

        Require expr %{REQUEST_URI} =~ m#<some pattern>#

### Log Rotation

-   Pipe CustomLog to a script:

         LoadModule logio_module modules/mod_logio.so

        <IfModule mod_logio.c>
                CustomLog "| some-script.sh"  "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\""
        </IfModule>

    Do logrotation using Apaches logrotate script:

        CustomLog "|/usr/local/apache/bin/rotatelogs /var/log/access_log 86400" common 

    Perform logrotation with
    [cronolog](http://sourceforge.net/projects/cronolog/):

        CustomLog "|/usr/local/sbin/cronolog /logs/%m-%d-%Y-access.log" combined

    The advantage of cronolog is that you may pass filenames with
    strptime format patterns that are replaced by cronolog. And the are
    evaluated all the time so that over time cronolog writes into
    different files according to your pattern.

## Data Privacy

Alternatives to avoid tracking users by IP:

- Completely remove IPs: Replace %h in you LogFormat with "-", this ensures all log reading tools can still parse the logs
- Use a piped CustomLog and replace the IP ad-hoc
- Replace the IPs during log rotation
- Truncate the IP using rewrite rules, by extracting all but the last octect of the IP using RewriteCond regex and save  the result with the last octect set to 0 in an env variable in a RewriteRule, finally use the env variable in the LogFormat (see (StackOverflow)[https://stackoverflow.com/questions/19452624/apply-a-mask-to-ip-with-logformat])

      # Note: also needs a IPv6 pattern
      RewriteCond %{REMOTE_ADDR} ^(\d+\.\d+\.\d+\.)\d+$
      RewriteRule 

## Mitigating security issues

### Hide Server Name

    ServerSignature Off
    ServerTokens Prod

### Disable SSLv2 and SSLv3

    SSLProtocol all -SSLv2 -SSLv3

### DH downgrade

Create a unique DH group

    openssl dhparam -out dhparams.pem 2048

and load it from Apache config

    SSLOpenSSLConfCmd DHParameters "{path to dhparams.pem}"

finally load [sane ciphers](#Sane%20Ciphers).

### Sane Ciphers

Suggestion from 22.5.2015 by
[weakdh.org](https://weakdh.org/sysadmin.html):

    SSLCipherSuite          ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA

    SSLHonorCipherOrder     on
