### Config Syntax

Validate config with [gixy](https://github.com/yandex/gixy) (static
config analyzer)

#### Proxy Pass + Rewrite

For example strip a path before proxy passing...

    location ~ <expr> {
       rewrite /<path to strip>/(.*) /$1 break;
       proxy_pass http://127.0.0.1:8080;
    }

#### Proxy Pass + Host Header

By default proxy pass doesn't pass the header. This needs to be said
explicitly:

    location / {
        proxy_pass       http://localhost:8000;
        proxy_set_header Host $host;
    }

#### Complex Conditions

As nginx does not support complex logic in if() conditions you need to
set flags in a smart way to workaround it.

    # Define a control flag
    set $extra_handling = 0;

    # Set the control flag when needed
    if ($variable1 ~* pattern) {
        set $extra_handling = 1;
    }

    # Unset the flag if needed
    if ( $variable2 = 1 ) {
        set $extra_handling = 0;
    }

    if ( $extra_handling = 1 ) {
        # Trigger intended behaviour
    }

### Mitigation

A general description on secure nginx configuration can be found here:
[https://raymii.org/s/tutorials/Strong\_SSL\_Security\_On\_nginx.html](https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html)

#### BEAST

    ssl_ciphers RC4:HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;

#### DH downgrade

Create unique DH group

    openssl dhparam -out dhparams.pem 2048

Enable it in config

    ssl_dhparam {path to dhparams.pem}

And set [sane ciphers](#Sane%20Ciphers).

#### Sane Ciphers

Suggestion from 22.5.2015 by
[weakdh.org](https://weakdh.org/sysadmin.html):

    ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA';

    ssl_prefer_server_ciphers on;

### Enabling Features

#### FPC with memcached

Full Page Cache (FPC) with memcached

    if ($request_method = GET) {
        set $memcached_key some_prefix$request_uri;
        memcached_pass memcached;
        error_page 404 = @nocache;
    }

#### FastCGI caching

    set $nocache "";
    if ($http_cookie ~ SESS) {
        set $nocache "Y";
    }
    fastcgi_cache mycache;
    fastcgi_cache_key $scheme$host$uri$args;
    fastcgi_ignore_headers Expires;
    fastcgi_cache_bypass $nocache;
    fastcgi_no_cache $nocache;

#### OSCP Stapling

Available starting with nginx 1.3.7

    ssl_stapling on;
    ssl_stapling_verify on;
    resolver 8.8.8.8 8.8.4.4 valid=300s;
    resolver_timeout 5s;
