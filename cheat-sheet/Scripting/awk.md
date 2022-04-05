---
related:
  cheat-sheet: ['sed']
---

## Matching

Match lines

    awk '$1 ~ /pattern/ { ... }' infile

Matching for Conditions

    awk '{if($1 ~ /pattern) { ... }}' infile

## Blocks

    BEGIN { print("only run at start") }
    { print("run for each line") }
    END { print("only run at end") }

## Advanced Use of awk

### Negative Indizes

    awk '{print $(NF - 1)}'
