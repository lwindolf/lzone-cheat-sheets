## kcadm oddities

Note: kcadm CLI parameters are a bit odd:

1. the object for "create" operation is always plural!
2. default parameters for "get"/"create"/... need to come directly after the verb
3. `--realm` is for authentication only while `-r` speficies the realm to perform actions against

## Login

It is important to distinguish the `--realm` value given on login from the realm passed to commands, because the `admin` in realm master has (by default) permissions on all realms.

    kcadm.sh config credentials \
      --server http://127.0.0.1:8080/auth \
      --realm master \
      --user admin \
      --password admin

In case you want have a single command follow this syntax

    kcadm.sh <command> --realm master --user ... --password ... --server ... -r <other realm> <params>

## CLI

    kcadm.sh get realms
    kcadm.sh get -r master clients
    kcadm.sh get -r master identity-provider/instances

    kcadm.sh create clients -f - <<EOT
        {
                "clientId": "client-1234567890",
                "secret": "$CLIENT_SECRET",
                "rootUrl": "$CLIENT_ROOT_URL",
                "redirectUris": [ "$CLIENT_REDIRECT_URI" ],
                "protocol": "openid-connect",
                "standardFlowEnabled": "true",
                "enabled": true
        }
    EOT
