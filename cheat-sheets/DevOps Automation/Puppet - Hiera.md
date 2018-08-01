See also <?add topic='Puppet'?>

## Hiera Queries

On Puppet master:

    hiera <key>       # to query common.yaml only
    hiera <key> -m <FQDN>   # to query config of a given node (using mcollective)
    hiera <key> -i <FQDN>   # to query config of a given node (using Puppet inventory)
    hiera <key> environment=production fqdn=myhost1   # to pass values for hiera.yaml

    # To dump complex data
    hiera -a <array key>
    hiera -h <hash key>
    
## Escaping Hiera Literals

When passing string in Hiera you can use Hiera/Puppet functions with %{}

    key: "value %{lookup('something')}"
    
If you actually need a "%{" literal you should use the function "literal" to insert it. So instead of writing

    time_format: "%{YYYY-MM-dd}"
    
write

    time_format: "%{literal('%')}{YYYY-MM-dd}"

Effectively replace each occurence of '%' with %{literal('%')}

## Encryption with eyaml

Using eyaml CLI

    eyaml encrypt -f <filename>
    eyaml encrypt -s <string>
    eyaml encrypt -p      # Encrypt password, will prompt for it

    eyaml decrypt -f <filename>
    eyaml decrypt -s <string>

    eyaml edit -f <filename>    # Decrypts, launches in editor and reencrypts

## Debugging eyaml Problems

When using Hiera + Eyaml + GPG as Puppet configuration backend one can run into a multitude of really bad error message. The problem here is mostly the obscene layering of libraries e.g. Eyaml on top of Eyaml-GPG on top of either GPGME or Ruby GPG on top on GnuPG. Most errors originate from/are reported by GnuPG and are badly unspecified.

This post gives some hints on some of the errors

### [hiera-eyaml-core] General error

This is one of the worst errors you can get. One common cause is an expired GPG key. Check for it using

    LANG=C gpg -k | grep expired

and remove the expired key with

    gpg --delete-key <name

As the error label indicates this can have other causes. In such a case check out the GPGME Debugging section below.

### [hiera-eyaml-core] no such file to load -- hiera/backend/eyaml/encryptors/gpg

If you got this you probably forgot to install the Ruby GEM. Fix it by running

    gem install hiera-eyaml-gpg

### [hiera-eyaml-core] GPG command (gpg --homedir /home/lars/.gnupg --quiet --no-secmem-warning --no-permission-warning --no-tty --yes --decrypt) failed with: gpg: Sorry, no terminal at all requested - can't get input

This error indicates a problem getting your secret key password. As Eyaml triggers GPG in background no password prompt can be issued. So the only way to get one is the PHP agent. In this case it might be dead.Check if one is running:

    pgrep -fl gpg-agent

### [gpg] !!! Fatal: Failed to decrypt ciphertext (check settings and that you are a recipient) [hiera-eyaml-core] !!! Decryption failed

If you get this error message you might want to check if you have a matching private key listed in your GPG recipient using

    gpg -K

### GPGME Debugging

No matter what error message you get if you cannot solve consider enabling debug traces by setting

    export GPGME_DEBUG=9

Then run "eyaml" and check the output for sections of "_gpgme_io_read" that indicate the GnuPG responses like this one:

    GPGME 2016-06-16 12:33:55 <0x45b7>    _gpgme_run_io_cb: call: item=0x2363d70, handler (0x21abc30, 7)
    GPGME 2016-06-16 12:33:55 <0x45b7>    _gpgme_io_read: enter: fd=0x7, buffer=0x238b6c0, count=1024
    GPGME 2016-06-16 12:33:55 <0x45b7>    _gpgme_io_read: check: 5b474e5550473a5d 20494e565f524543 [GNUPG:] INV_REC
    GPGME 2016-06-16 12:33:55 <0x45b7>    _gpgme_io_read: check: 5020302035444136 3939343530393537 P 0 5DA699450957
    GPGME 2016-06-16 12:33:55 <0x45b7>    _gpgme_io_read: check: 3346354543394341 4138413232433134 3F5EC9CAA8A22C14
    GPGME 2016-06-16 12:33:55 <0x45b7>    _gpgme_io_read: check: 3846433938453339 374335430a5b474e 8FC98E397C5C.[GN
    GPGME 2016-06-16 12:33:55 <0x45b7>    _gpgme_io_read: check: 5550473a5d204641 494c55524520656e UPG:] FAILURE en
    GPGME 2016-06-16 12:33:55 <0x45b7>    _gpgme_io_read: check: 6372797074203533 0a               crypt 53.
    GPGME 2016-06-16 12:33:55 <0x45b7>    _gpgme_io_read: leave: result=89

If you overlook the bad wrapping you see the following info here:

    INV_RECP 0 5DA699450957.... FAILURE encrypt 53

Google for those messages and you often get a GnuPG related result hinting on the cause. Above trace is about an invalid key with fingerprint 5DA699450957.... which you can find with listing your GPG keys and checking for expiration messages. 

#### Hiera+Puppet Debugging

    puppet apply -e "notice(hiera_array('some key'))"

