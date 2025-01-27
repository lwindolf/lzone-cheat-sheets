This cheat sheet is about Hashicorp Vault

## CLI

    vault status
    vault login
    vault auth list
    vault token renew

    vault policy list
    vault policy read <name>
    vault policy write <name> <mypolicy.hcl>

    vault write <user path> value=<policy>

    vault kv get <path>
    vault kv get --field <name> <path> 
    vault kv get -version <path>
    vault kv put <path> <key>=<value>
    vault kv delete <path>
    
