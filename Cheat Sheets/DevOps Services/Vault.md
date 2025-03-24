This cheat sheet is about Hashicorp Vault

## CLI

    VAULT_ADDR=https://<server> vault login
    vault login -address=https://<server>

    vault status
    vault auth list
    vault token renew

    vault -autocomplete-install

    vault policy list
    vault policy read <name>
    vault policy write <name> <mypolicy.hcl>

    vault write <user path> value=<policy>

    vault kv get <path>
    vault kv get --field <name> <path> 
    vault kv get -version <path>
    vault kv put <path> <key>=<value> [<key>=<value> [...]]
    vault kv put <path> @data.json
    echo <value> | vault kv put <path> <key>=-
    
    vault kv patch <path> <key>=<value>
    vault kv delete <path>
    
    
