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

To create a client

    kcadm.sh create -r myrealm clients -f - <<EOT
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

To create an OIDC IDP

    kcadm create -r myrealm identity-provider/instances -f - <<EOT
    {
      "alias"       : "idp-alias",
      "displayName" : "my special idc",
      "providerId"  : "keycloak-oidc",
      "config" : {
        "tokenUrl"         : "https://$DOMAIN/realms/$REALM/protocol/openid-connect/token",
        "issuer"           : "https://$DOMAIN/realms/$REALM",
        "userInfoUrl"      : "https://$DOMAIN/realms/$REALM/protocol/openid-connect/userinfo",
        "authorizationUrl" : "https://$DOMAIN/realms/$REALM/protocol/openid-connect/auth",
        "logoutUrl"        : "https://$DOMAIN/realms/$REALM/protocol/openid-connect/logout",
        "clientId"         : "$CLIENT_ID",
        "clientSecret"     : "$CLIENT_SECRET"
      }
    }
    EOT

## Enable audit logs

First you need to enable audit events (which are stored in the keycloak DB and can be viewed under "Events" in the main menu):

    kcadm.sh update events/config -r <your_realm> \
      -s "adminEventsEnabled=true" \
      -s "eventsEnabled=true" \
      -s 'enabledEventTypes=["LOGIN", "LOGIN_ERROR", "REGISTER"]'

Next you need to ensure to make them visible in the log. Per default events are logged at DEBUG which is too high volume. So you need to pass ENV vars or CLI params to change the severity level (from [see also](https://www.n-k.de/2023/09/keycloak-events-logging-revised.html)):

    KC_SPI_EVENTS_LISTENER_JBOSS_LOGGING_SUCCESS_LEVEL=info
    KC_SPI_EVENTS_LISTENER_JBOSS_LOGGING_ERROR_LEVEL=warn
