Example-wise the jq manpage is not really helpful. Let's document some
simple examples here...

### Output Formatting

If you do only care about output formatting run

    cat my.json | jq '.[]'

### Simple Extraction

Extract only some attributes from a list of objects

    jq '.[] | {attribute1, attribute2}'

Filter this by attribute

    jq '.[] | select(attribute1 == "") | {attribute1, attribute2}'
