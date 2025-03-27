---
related:
  cheat-sheet: ['sed']
---

## Matching

Match lines

    awk '$1 ~ /pattern/ { ... }' infile

Matching for Conditions

    awk '{if($1 ~ /pattern) { ... }}' infile

Negative Pattern

    !/abc/ { print }

## Blocks

    BEGIN { print("only run at start") }
    
    { print("run for each line") }
    
    END { print("only run at end") }
    
When using multiple files

    BEGINFILE {print "--- " FILENAME " ---"}
    ENDFILE { }
    
## Control Flow

    if (condition) { print("do something") } else { print("something else") }
    
    # Ternary operator
    print(a == b ? "equal":"more than equal")
    
    # Loops
    for(i=0; i<100; i+=1) { print(i) }

    next          # skip to next line
    nextfile      # skip to next file
    exit          # terminate 
    exit(1)       # with exit code

##  Variables

| Name   | Meaning  | Description |
|--------|----------|-------------|
| NF     | number of fields | always givens the number of fields in current line based on `IFS` |
| ARGV   | like in C | all extra CLI params not consumed by awk |
| ARGC   | like in C | nr of extra CLI params not consumed by awk |

## Input/Output Control Variables

| Name   | Meaning  | Description |
|--------|----------|-------------|
| ORS    | Output Record Separator  | String added after each `print` output (can be a regex). |
| RS     | (Input) Record Separator | Decides how input lines will be split (can be a regex). |
| IFS    | Input Field Separator | Decides how input fields will be split. |
| FS     | Field Separator | Decides how output fieds will be joined. |

You usually use those variables by either setting them in the `BEGIN` block or using `-v`.

Examples

    awk -v ORS='\r\n' '{ print }'                # Use \r\n line endings instead of \n
    find -print0 | awk -v RS='\0' '{ print }'    # Safe filename processing by using \0 as input separator
    awk -v IFS=, '{ print $3 }' my.csv           # Process CSV by splitting fields on comma
    awk 'BEGIN { FS="," } '{ print $1, $3 }'     # Produce CSV from whitespace separated input

## Passing shell variables

Use `-v <key>=<value>` or `ENVIRON["<variable>"]`

    awk -v HOME="$HOME" 'BEGIN { print(HOME) }'

    awk 'BEGIN { print ENVIRON["SHELL"] }'

## Advanced Use of awk

### Negative Indizes

    awk '{print $(NF - 1)}'
