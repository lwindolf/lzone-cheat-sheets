## CLI

### Copying

Important: ALWAYS think about wether you want trailing / chars!
    
    rsync -avz  src dest           # content of ./src/ transferred to ./dest/
    rsync -avz  src dest/          # content of ./src/ transferred to ./dest/src/

Copying to remote servers

    rsync -avz -e "ssh -l <user>" <src> <user>@<server>:<target>

Test with dry-run first!

    rsync --dry-run <...>

### Filtering files

By pattern

    rsync <...> --filter="- *.bak" <src> <target>         # Exclude .bak fukes

By include/exclude/explicit list

    rsync <...> --exclude-from=<exclude list file> <...>
    rsync <...> --include-from=<include list file> <...>
    rsync <...> --files-from=<explicit list file>   <...>
    

### Fast delete with rsync

Rsync can delete much much faster than find:

    rsync -a --delete dir_to_empty/ <any_empty_dir>

### Managing bandwith

    --bwlimit=100     # 100kB/s on average
