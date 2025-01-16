## CLI

You can use `curl` for LDAP connections!

    curl -v -u "<service account>:<password>" ldaps://server:636 -d "(objectClass=*)"

Or use `ldapsearch`

    ldapsearch -H ldaps://<host>:636 -D "<bind DN>" -w <password> -b "<base DN>"  "(sAMAccountName=myuser)" -x

Connect with special CA cert

    env LDAPTLS_CACERT=myca.crt ldapsearch [...]

To debug connection or query errors set a trace level with `-d`

    ldapsearch -d 5 [...]
