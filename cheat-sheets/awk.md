See Also: <?add topic='sed'?>

### Matching

Match lines

    awk '$1 ~ /pattern/ { ... }' infile

Matching for Conditions

    awk '{if($1 ~ /pattern) { ... }}' infile

### Advanced Use of awk

#### Negative Indizes

    awk '{print $(NF - 1)}'
