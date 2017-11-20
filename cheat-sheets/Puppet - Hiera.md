See also <?add topic='Puppet'?>

### Hiera

#### Hiera Queries

On Puppet master:

    hiera <key>       # to query common.yaml only
    hiera <key> -m <FQDN>   # to query config of a given node (using mcollective)
    hiera <key> -i <FQDN>   # to query config of a given node (using Puppet inventory)
    hiera <key> environment=production fqdn=myhost1   # to pass values for hiera.yaml

    # To dump complex data
    hiera -a <array key>
    hiera -h <hash key>

#### Encryption with eyaml

Using eyaml CLI

    eyaml encrypt -f <filename>
    eyaml encrypt -s <string>
    eyaml encrypt -p      # Encrypt password, will prompt for it

    eyaml decrypt -f <filename>
    eyaml decrypt -s <string>

    eyaml edit -f <filename>    # Decrypts, launches in editor and reencrypts

#### Debugging eyaml Problems

See [Hiera EYAML GPG
Troubleshooting](https://lzone.de/blog/Hiera+EYAML+GPG+Troubleshooting)

#### Hiera+Puppet Debugging

    puppet apply -e "notice(hiera_array('some key'))"

