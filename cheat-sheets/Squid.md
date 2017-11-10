### Instant Squid

Ever needed to test your HTTP client app proxy support? Need an instant
proxy test setup? Here is a fast way to set up a local proxy server on
Debian using squid:

    apt-get install squid

Now edit the squid configuration /etc/squid/squid.conf.

#### Edit ACLs

Ensure to have something like the following:

    acl all src all
    acl users proxy_auth REQUIRED

#### Edit access definitions

You need (order is important):

    http_access allow users
    http_access deny all

#### Setup Dummy Auth

    auth_param basic program /usr/local/bin/squid_dummy_auth
    auth_param basic children 5
    auth_param basic realm Squid proxy-caching web server
    auth_param basic credentialsttl 2 hours
    auth_param basic casesensitive off

#### Create Auth Script

Create /usr/local/bin/squid\_dummy\_auth with something like:

    #!/bin/sh

    while read dummy;
    do
       echo OK
    done

and make it run

    chmod a+x /usr/local/bin/squid_dummy_auth

#### Restart

Finally restart squid

    /etc/init.d/squid restart

With this you have a working Basic Auth proxy test setup running on
localhost:3128.
