---
related:
  cheat-sheet: ['Bash']
---

## Indexed Arrays in Bash

Unlike hashes indexed arrays require no declaration. Just assign values

    # Assigning a fixed list
    arr=("string 1", "string 2", "string 3")
    
    # Pushing to an array
    arr+=("new string value", "another new value")

    # Assigning with indizes, allows sparse lists
    arr=([1]="string 1", [2]="string 2", [4]="string 4")

    # Adding single elements by index
    arr[4]="string 4"

Indexed arrays are accessed the same way as "Hashes". See below for accessing the different properties of an
array.

## Hashes in Bash

Associative arrays (aka hashes) can be used since Bash v4 and need a declaration like this

    declare -A arr

After declaring the hash "arr" assign values like this

    arr[my key]="my value"
    arr["my key"]="my value"
    arr[$my_key]="my value"

And access them like this

    echo ${arr[my key]}
    echo ${arr["my key"]}
    echo ${arr[$my_key]}

Or check hash properties...

    ${arr[@]}         # Returns all indizes and their items (doesn't work with associative arrays)
    ${arr[*]}         # Returns all items
    ${!arr[*]}        # Returns all indizes
    ${#arr[*]}        # Number elements
    ${#arr[$n]}       # Length of $nth item

### Iterating Bash Hashes

    # Print = lines...
    for k in "${!array[@]}"
    do
      printf "%s\n" "$k=${array[$k]}"
    done
