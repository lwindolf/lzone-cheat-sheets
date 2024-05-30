Example-wise the jq manpage is not really helpful. Let's document some simple examples here...

To test queries live use [jqplay.org](https://jqplay.org/)

## Output Formatting

If you do only care about output formatting (pretty print) run

```sh
jq . my.json
```

or when reading from a pipeline

```sh
cat my.json | jq
```

Note: for redirection you need to pass a filter too to avoid a syntax error:

```sh
jq . my.json > output.json
```

## jq Extraction Examples

Consider this example document

```json
{
	"timestamp": 1234567890,
	"report": "Age Report",
	"results": [
		{ "name": "John", "age": 43, "city": "TownA" },
		{ "name": "Joe",  "age": 10, "city": "TownB" }
	]
}
```

To extract top level attributes "timestamp" and "report"

```sh
jq '. | {timestamp,report}'
```

To extract name and age of each "results" item

```sh
jq '.results[] | {name, age}'
```

To extract name and age as text values instead of JSON

```sh
jq -r '.results[] | {name, age} | join(" ")'
```

Filter this by attribute

```sh
jq '.results[] | select(.name == "John") | {age}'          # Get age for 'John'
jq '.results[] | select((.name == "Joe") and (.age = 10))' # Get complete records for all 'Joe' aged 10
jq '.results[] | select(.name | contains("Jo"))'           # Get complete records for all names with 'Jo'
jq '.results[] | select(.name | test("Joe\\s+Smith"))'     # Get complete records for all names matching PCRE regex 'Joe\+Smith'
```

Avoid `null` output when accessing non-existing keys

```sh
jq '.mykey | select(. != null)'
```

## "Deep" Value Extraction

If you want to combine subkeys at different levels it won't work like this

```sh
jq '.items[] | { metadata["created"], name }'
```

Instead you can access values like this

```sh
jq '.items[] | { "created" : .metadata["created"], name }'
```

Or like this

```sh
jq '.items[] | .metadata["created"], .name'
```

The drawback being, that you do not get a JSON output, but each value on a new line.

## Accessing unknown keys

When processing objects you might not know about some keys, in this case use `to_entries`. For example
if you want to have all property fields of the following JSON:

```sh
echo '{
	"name": "R1",
	"type": "robot",
	"prop1": "a5482na",
	"prop2": null,
	"prop3": 55 
}' |\
jq '. | to_entries[] | select( .key | contains("prop"))'
```

will give you

```json
{
  "key": "prop1",
  "value": "a5482na"
}
{
  "key": "prop2",
  "value": null
}
{
  "key": "prop3",
  "value": 55
}
```

## Changing values with jq

Merging/overwriting keys

```sh
echo '{ "a": 1, "b": 2 }' |\
jq '. |= . + {
  "c": 3
}'
```

Adding elements to lists

```sh
echo '{ "names": ["Marie", "Sophie"] }' |\
jq '.names |= .+ [
   "Natalie"
]'   
```

## Delete values with jq

	jq 'del(.somekey)' input.json

## Merge JSON strings

For example merge three object lists:

```sh
echo '[ {"a":1}, {"b":2} ]' | \
jq --argjson input1 '[ { "c":3 } ]' \
   --argjson input2 '[ { "d":4 }, { "e": 5} ]' \
   '. = $input1 + . +  $input2'
```

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

```json
{
   "animals": [
	   "dog": { },
	   "cat": { }
	 ]
}
```

you can extract the names of the animals using

```sh
jq '.animals | keys'   
```

## Replacing stuff

### With map()

If you want to transform a subset of the input JSON and only see the transformed part you can use `map`. For example:

    jq '.people | map(select(.name == "Tim") | .age |= 15)' 

will print the record of "Tim" with "age" set to "15". All other records are not printed! If you want all records
with the changed data of "Tim" check out the following solution with `walk`

### With walk()

   jq '.people | walk(if type == "object" and has("name") and name == "Tim" then .age |= 15 else . end)'

## Using jq in Shell Scripts

From [https://www.terraform.io/docs/providers/external/data_source.html](https://www.terraform.io/docs/providers/external/data_source.html)

### Parsing JSON into env vars

To fill environment variables from JSON object keys (e.g. $FOO from jq query ".foo")

```sh
export $(jq -r '@sh "FOO=\(.foo) BAZ=\(.baz)"')
```

To make a bash array from a JSON list

```sh
bash_array=($(jq -r '.mylist | @sh'))
```

or

```sh
read -a bash_array < <(jq -r .|arrays|select(.!=null)|@tsv)
```
    
### JSON template using env vars

To create proper JSON from a shell script and properly escape variables:

```sh
jq -n --arg foobaz "$FOOBAZ" '{"foobaz":$foobaz}'
```

### URL Encode

Quick easy way to url encode something

```sh
date | jq -sRr @uri
```

### String Concat

Concatenation like this:

```sh
echo '{ "object" : { "name": "banana", "color": "yellow" }}' |\
jq -r '.object | (.name)+" is "+(.color)'
```

will print `banana is yellow`.

### String Interpolation

Or using Interpolation:

```sh
echo '{ "object" : { "name": "banana", "color": "yellow" }}' |\
jq -r '.object | "\(.name) is \(.color)"'
```

will *also* print `banana is yellow`.

## Math Functions

jq can use math function from your libc. For example:

```sh
echo '{ "a": 1234.56 }' | jq '.a | round'     # gives 1235
echo '{ "a": 1234.56 }' | jq '.a | floor'     # gives 1235
echo '{ "a": 1234.56 }' | jq '.a | ceil'      # gives 1234
```

## Misc

- Split JSON files https://stackoverflow.com/questions/49808581/using-jq-how-can-i-split-a-very-large-json-file-into-multiple-files-each-a-spec
