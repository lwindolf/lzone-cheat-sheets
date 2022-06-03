## Auth Variants

For a list of OAuth proxies for use with k8s check out the [kubernetes cheat sheet](/cheat-sheet/kubernetes). 

### Basic Auth

Create an ingress annotation like this:

    annotations:
      kubernetes.io/ingress.class: "nginx"
      nginx.ingress.kubernetes.io/auth-type: basic
      nginx.ingress.kubernetes.io/auth-secret: auth
      nginx.ingress.kubernetes.io/auth-realm: "Login Required"

and provide an htpasswd secret like this in the ingress namespace

    htpasswd -c ./auth <user name>
    kubectl create secret generic auth  --from-file ./auth

### Transparent OAuth2 Proxy

When using Bitly's oauth2_proxy running as service "oauth2_proxy" you can create a transparent proxy like this

    annotations:
      kubernetes.io/ingress.class: "nginx"
      nginx.ingress.kubernetes.io/auth-signin: "http://${OAUTH2_PROXY_SERVICE_HOST}:${OAUTH2_PROXY_SERVICE_PORT}/oauth2/start?rd=$request_uri"
      nginx.ingress.kubernetes.io/auth-url: "http://${OAUTH2_PROXY_SERVICE_HOST}:${OAUTH2_PROXY_SERVICE_PORT}/oauth2/auth"
      nginx.ingress.kubernetes.io/ssl-passthrough: "false"
      nginx.ingress.kubernetes.io/secure-backends: "false"       # <-- when your service speaks HTTP
      nginx.ingress.kubernetes.io/configuration-snippet: |
        auth_request /oauth2/auth;
        error_page 401 = /oauth2/start?rd=/;

## Reverse Proxy

[Reddit Reverse Proxy for Deployment](https://www.reddit.com/r/kubernetes/comments/f1iery/reverse_proxy_in_front_of_kubernetes_deployment/)

## Debugging

- [Dumping nginx-ingress config](https://kubernetes.github.io/ingress-nginx/troubleshooting/#using-gdb-with-nginx)
