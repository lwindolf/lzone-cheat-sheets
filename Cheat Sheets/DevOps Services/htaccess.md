## Validation

Can be done using https://htaccess.mwl.be/

## Authentication

    AuthName "Authenticate"
    AuthUserFile /some/path/.htpasswd
    AuthType basic
    Require valid-user
    Order deny,allow
    Deny from all

    # Exceptions:
    #Allow from 1.2.3.4
    #Allow from googlebot.com
    Satisfy Any

## Redirect old stuff

    Redirect 301 <old path> <new path>

## Only for file x

With pattern

    <FilesMatch "^image.*$">
    </FilesMatch>

Explicit

    <Files upload.php>
    # Do auth
    </Files>

## Block Everyone Except...

    ErrorDocument 403 http://domain.com/unauthorized
    Order deny,allow
    Deny from all
    Allow from vpn.domain.com

## Allow CGI

For example Perl:

    Options +ExecCGI
    AddHandler cgi-script cgi pl

## Prevent CGI

    Options -ExecCGI
    AddHandler cgi-script <script file extensions>

## Enforce Filetype

    ForceType application/x-httpd-php

## Set Environment Variables

    SetEnv SERVER_ADMIN webmaster@domain.com

## Set Charset

    AddDefaultCharset UTF-8

## Set Default Language

    DefaultLanguage en-US
