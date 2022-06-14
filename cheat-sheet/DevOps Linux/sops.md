## CLI

    export SOPS_PGP_FP=<comma separated fingerprints>
    
    sops <file>       # encrypt a file / edit encrypted file

## Collecting all fingerprints from a directory with public keys

Hardest thing with sops is to provide the public key fingerprints:

    for file in $(find $DIR -type f -regex '.*gpg.pub');
    do
      fp=$(cat $file | gpg --import-options show-only --quiet | awk '(NR == 2){ gsub(/ /,""); print }');
      if [ "$(gpg --list-keys | grep ${fp} | wc -l)" = "0" ]; then
        gpg --import $file
      fi
      SOPS_PGP_FP="$SOPS_PGP_FP,$fp"
    done

    SOPS_PGP_FP=`echo $SOPS_PGP_FP | sed 's/^\,//g'`
    export SOPS_PGP_FP
