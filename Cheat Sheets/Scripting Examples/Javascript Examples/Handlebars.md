## Path expressions

    {{somekey}}               # Extract the the value of somekey in current context
    {{somekey.subkey}}        # Extract child key
    {{../otherkey}}           # Other key below parent
    
    {{this}}                  # Current context
    {{this.subkey}}           # Same as {{subkey}}

## Conditions

    {{#if somekey}}
        somekey does exist!
    {{/if}}

Also with else

    {{#if somekey}}
        somekey does exist!
    {{else}}
        no it does not
    {{/if}}

## Comments

Choose one of the two comment variants depending on wether your comment includes the literal " }}" or "--}}":

    {{! comment }}
    {{!-- comment --}}

## Iterating Lists

    {{#each entries}}
        <div>{{name}}</div>
    {{/each}}
    
## Iterating Hashes

Note: This is considered non-idiomatic.

Works if you are in the correct scope and iterate on "this"

    {{#each this}}
         <div>key: {{@key}}</div>
    {{/each}}
    
Traverse nested objects

    {{#each this}}<div>key at level 1: {{@key}}</div>
    {{#each this}}<div>key at level 2: {{@key}}</div>
    {{#each this}}<div>key at level 3: {{@key}}</div>
    ...
    {{/each}}
    {{/each}}
    {{/each}}

## Helper Callbacks

Any expression with the following form {{\<helper> \<path>}} invokes a helper callback.

Register a helper callback:

    Handlebars.registerHelper('myHelper', function(data) {
       # Return a string here...
    });

And call above example helper like this:

    {{myHelper somekey}}
   
## Reusing Template Snippets (Partials)

Use a partial

    {{> mySnippet}}                         # No params...
    {{> mySnippet param1="1" }}             # Invoke with literal parameter

For it to work register it:

     Handlebars.registerPartial('mySnippet', 'Some template expression {{param1}}');
