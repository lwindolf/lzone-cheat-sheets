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

    rsync -avz --filter="- *.bak" <src> <target>         # Exclude .bak fukes

### Fast delete with rsync

Rsync can delete much much faster than find:

    rsync -a --delete dir_to_empty/ <any_empty_dir>
