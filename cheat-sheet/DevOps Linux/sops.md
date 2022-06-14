## CLI

    export SOPS_PGP_FP=<comma separated fingerprints>
    
    sops <file>       # encrypt a file / edit encrypted file
    sops -d <file>    # decrypt file to STDOUT
    sops -e <file>    # edit encrypted file
    
    sops updatekeys -y <file>     # update fingerprints in encrypted file

## Control encryption with .sops.yaml 

Manage file groups and map them to key rings:

    creation_rules:
    - path_regex: '(somedir1/*.|somedir2/subdir/*.enc.yml)'
      pgp: >-
         <fp1>
         <fp2>
         ...
         
    - path_regex: 'somedir3/admins/*.enc.yml'
      pgp: >-
         <fp1>
         <fp3>
         ...

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
