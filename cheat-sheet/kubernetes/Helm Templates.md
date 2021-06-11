---
related:
  cheat-sheet: ['Helm']
---
{% raw %}

Note that while Helm uses Go templates it does so by using the 
[Sprig templating library](https://masterminds.github.io/sprig/) 
which provides additional functions that you can use.

## Newline Handling

    {{ <something> }}              # Will produce a newline
    {{- <something> }}             # Will not produce a newline

## Chart Value Replacing

    {{ .Values.param1 }}                   # Will insert the value of "param1" passed to your helm chart release
    {{ .Values.param2 | default "abc" }}   # Insert value or default value
    
    {{ $value1  }}                         # Will insert the value of variable "value1"

You can enforce value replacement (instead of getting empty defaults) with "required"

    {{ required "Please provide mandatory 'param1'!" .Values.param1 }}

Insert complex values as YAML

    {{- toYaml .Values.myhash }}
    {{- toYaml (.Files.get "myconfig.yaml") | nindent 2 }}

## Manipulating text

Note how string manipulation works using the pipeline operator |

    {{ .Values.param1 | quote }}      # You usually want to quote strings
    {{ .Values.passwd | b64enc }}     # Base64 encoding
    {{ .Values.param | upper }}       # Uppercase everthing
    {{ .Values.param | lower }}       # Lowercase everything
    
    {{ .Values.param | indent 16 }}   # Print with additional 16 leading spaces
    {{ .Values.param | nindent 16 }}  # Ensure total indentation is 16 (useful when template code is indented)
    
    {{ randAlphaNum 5 }}              # Produce random string 5 chars long
    
    {{ "Hello" | repeat 3 }}          # "HelloHelloHello"
    
    # Use format strings with printf
    {{- printf "%s (%d)\n" .Values.param1 .Values.param2 .Values.param3 }}

Perform complex concatenations using pipelines in braces "( x | y )" which will catch the output of the pipeline

    {{- printf "plain password: %s\nbase64 password %s\n" .Values.password (.Values.password | b64enc) }}

## Accessing complex data structure

    {{ .Values.hash.key1 }}        # Access single hash key
    
    # Iterate a hash
    {{- range $key, $value := .Values.myhash }}
    {{- printf "key %s: value %s\n" $key $value }}
    {{- end }}
    
    # Iterate a list
    {{- range .Values.mylist }}
    {{- printf "list element: %s\n" . }}     # access element with "."
    {{- end }}

## Conditions

    {{- if <pipeline> }}
       conditional block
    {{ else }}
       other block
    {{- end }}

Example pipelines to use as conditions

    hasKey .Values.mymap "mykey"      # Check hash for key
    gt .Values.replicaCount 2.0       # replicaCount > 2.0
    lt .Values.replicaCount 5.0       # replicaCount < 5.0
    eq .Values.replicaCount 1.0       # replicaCount exactly 1.0
    
Complex conditions using nested pipelines

    not (and (hasKey .Values.mymap "mykey") (lt .Values.replicaCount 2.0))

## Reading files

    {{ print $.Template.BasePath "/configmap.yaml" }}

## Reusing code with include

    {{ include mytemplate.tpl }}   # invoke content of mytemplate.tpl right here
                                   # if it produces output it will get replaced

## Using variables

Save context using variable

    {{- $root := . }}
    {{- with .Values.something }}
       ...
       someGlobal: {{ $root.Values.someGlobal }}
    {{- end }}

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
{% endraw %}
