## Usage

`xargs` is about converting input lines to parameters

     cat pet-names.txt | xargs          # All names in a line
     cat pet-names.txt | xargs -2       # Only 2 names per line

     find . -print0 | xargs -0          # Only safe way to iterate file paths

When processing input xargs removes quotes. To prevent this use `-d$'\n'`

     <some command> | xargs -d$'\n' <params>


Use `-I` to define a replace pattern in the command specified where you can
insert the passing value multiple times. For example construct a mv command
that renames files:

    find . -print0 | xargs -0 -I{} echo mv {} {}.old
