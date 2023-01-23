## GPG Usage

### Encrypting

    gpg -e [-u "<user>"] -r "<recipient>" <infile>
    gpg -se -r <recipient> <infile>      # with signing

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

## Passphrase caching

In `~/.gnugp/gpg-agent.conf` add

    default-cache-ttl 1800
    max-cache-ttl 3600


## Troubleshooting

### Recovery failed because no master key was able to decrypt the file

Happens often when you actually want to unlock your keyring first, but
the invocation context of gpg does not allow it. Ensure a valid terminal exists:

    export GPG_TTY=$(tty)
    
### Ensure GPG gets all changed settings

    echo RELOADAGENT | gpg-connect-agent
