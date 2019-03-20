## GPG Usage

### Encrypting

    gpg -e [-u ""] -r "" <infile>
    gpg -se -r <Name> <infile>      # with signing

## Managing Keys

### Create new key

    gpg --full-generate-key

### List public keys

    gpg -k 
    gpg -k <keyring file>
    gpg --list-keys

### List private keys

    gpg -K

### Transferring public keys

    gpg --import <files>
    gpg --export -a "<name>"

### Transferring secret key

    gpg --export-secret-key -a "<key name>" > keyfile
    gpg --allow-secret-key-import --import keyfile

### Deleting keys

    gpg --delete-key <name>
    gpg --delete-secret-key <name>
