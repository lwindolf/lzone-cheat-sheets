Note that while Helm uses Go templates it does so by using the 
[Sprig templating library](https://masterminds.github.io/sprig/) 
which provides additional functions that you can use.

## Newline Handling

    {{ <something> }}              # Will produce a newline
    {{- <something> }}             # Will not produce a newline

## Chart Value Replacing

    {{ .Values.param1 }}           # Will insert the value of "param1" passed to your helm chart release

You can enforce value replacement (instead of getting empty defaults) with "required"

    {{ required "Please provide mandatory 'param1'!" .Values.param1 }}

## Manipulating text

Note how string manipulation works using the pipeline operator |

    {{ .Values.param1 | quote }}   # You usually want to quote strings
    {{ .Values.passwd | b64enc }}  # Base64 encoding
    {{ .Values.param | upper }}    # Uppercase everthing
    {{ .Values.param | lower }}    # Lowercase everything
    
    # Use format strings with printf
    {{- printf "%s (%d)\n" .Values.param1 .Values.param2 .Values.param3 }}

Perform complex concatenations using pipelines in braces "( x | y )" which will catch the output of the pipeline

    {{- printf "plain password: %s\nbase64 password %s\n" .Values.password (.Values.password | b64enc) }}

## Reusing code with include

    {{ include mytemplate.tpl }}   # invoke content of mytemplate.tpl right here
                                   # if it produces output it will get replaced
                                   
## Defining and using functions

Define a "Hello World" function

    {{- define "myfunc" }}
    Hello world!
    {{- end }}

and invoke it

    {{ myfunc }}

our pass values

    {{ myOtherFunc "scalar" }}
    {{ myOtherFunc 64 }}
    {{ myOtherFunc . }}           # Provide current context to pass multiple values
