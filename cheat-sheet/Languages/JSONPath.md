<?add topic='jq'?>

## Syntax

Depending on the client used JSONPath expressions do start with `$.` indicating the root element.
Some clients omit the leading `$.`.

     $.store.book[0].title              
     store.book[0].title                # With implicit "$."
     
     $['store']['book'][0]['title']     # Alternative notation similar to scripting languages

## Tree Traversal

     $.parentNode.childNode.field       # XPath: /parentNode/childNode/@field (content of "field" of all "childNode"s of "parentNode")
     $..anyChildNode                    # XPath: //anyChildNode (all children at any depth named "anyChildNode"
     $.parentNode.*                     # XPath: /parentNode/* (all children below)

## Array Access

     $.myList[0]            # first element
     $.myList[-1]           # last element
     $.myList[2:3]          # range
     $.myList[0,4,5]        # selection

## Filtering

     $.customer[?(@.car)]                      # Only "customer"s that have attribute "car"
     $.customer[?(@.car == 'Ford Fiesta')]     # Only "customer"s with "Ford Fiesta"s
     $.customer[?(@.age > 18)]                 # Only adults

## Output Mapping

     $.[].{Name:name, Age:age, Hobbies:details.hobbies}        # Mapping fields/nested fields to new set
