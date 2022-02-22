Example-wise the jq manpage is not really helpful. Let's document some simple examples here...

To test queries live use [jqplay.org](https://jqplay.org/)

## Output Formatting

If you do only care about output formatting (pretty print) run

    jq . my.json

or when reading from a pipeline

    cat my.json | jq

Note: for redirection you need to pass a filter too to avoid a syntax error:

    jq . my.json > output.json

## jq Extraction Examples

Consider this example document

    {
        "timestamp": 1234567890,
        "report": "Age Report",
        "results": [
            { "name": "John", "age": 43, "city": "TownA" },
            { "name": "Joe",  "age": 10, "city": "TownB" }
        ]
    }

To extract top level attributes "timestamp" and "report"

    jq '. | {timestamp,report}'

To extract name and age of each "results" item

    jq '.results[] | {name, age}'
    
To extract name and age as text values instead of JSON

    jq -r '.results[] | {name, age} | join(" ")'

Filter this by attribute

    jq '.results[] | select(.name == "John") | {age}'          # Get age for 'John'
    jq '.results[] | select((.name == "Joe") and (.age = 10))' # Get complete records for all 'Joe' aged 10
    jq '.results[] | select(.name | contains("Jo"))'           # Get complete records for all names with 'Jo'
    jq '.results[] | select(.name | test("Joe\s+Smith"))'      # Get complete records for all names matching PCRE regex 'Joe\+Smith'
    
## "Deep" Value Extraction

If you want to combine subkeys at different levels it won't work like this

    jq '.items[] | { metadata["created"], name }'

Instead you can access values like this

    jq '.items[] | { "created" : .metadata["created"], name }'

Or like this

    jq '.items[] | .metadata["created"], .name'

The drawback being, that you do not get a JSON output, but each value on a new line.

## Changing values with jq

Merging/overwriting keys

    echo '{ "a": 1, "b": 2 }' |\
    jq '. |= . + {
      "c": 3
    }'

Adding elements to lists

    echo '{ "names": ["Marie", "Sophie"] }' |\
    jq '.names |= .+ [
       "Natalie"
    ]'   

## Delete values with jq

    jq 'del(.somekey)' input.json

## Merge files (since jq 1.4)

The following command will merge "somekey" from both passed files

    jq -s '.[0] * .[1] | {somekey: .somekey}' <file1> <file2>

## Handle Empty Arrays

When you want to iterate over an array, and the array you access is empty you get something like

    jq: error (at <stdin>:3): Cannot iterate over null (null)

To workaround the optional array protect the access with

    select(.my_array | length > 0)
    
## Testing Types

    $ echo '[true, null, 42, "hello", []]' | ./jq 'map(type)'
    ["boolean","null","number","string","array"]
    
## Extracting key names

Given an JSON object like this

    {
       "animals": [
           "dog": { },
           "cat": { }
         ]
    }

you can extract the names of the animals using

    jq '.animals | keys'   

## Using jq in Shell Scripts

From [https://www.terraform.io/docs/providers/external/data_source.html](https://www.terraform.io/docs/providers/external/data_source.html)

### Parsing JSON into env vars

To fill environment variables from JSON object keys (e.g. $FOO from jq query ".foo")

    export $(jq -r '@sh "FOO=\(.foo) BAZ=\(.baz)"')

To make a bash array
 
    read -a bash_array < <(jq -r .|arrays|select(.!=null)|@tsv)
    
### JSON template using env vars

To create proper JSON from a shell script and properly escape variables:

    jq -n --arg foobaz "$FOOBAZ" '{"foobaz":$foobaz}'

### URL Encode
Quick easy way to url encode something
 
    date | jq -sRr @uri
