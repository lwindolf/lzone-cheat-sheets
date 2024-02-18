This is a cheat sheet for the Jinja templating syntax.

## Syntax

     {{ ... }}           # Escaping for expressions that create output
     {% ... %}           # Escaping for control statements
     # ... ##            # Line statements

## Loops

     {% for i in list %} ... {% endfor %}

## Functions

Defining functions

     {% macro myfunct(param1, param2) %}
     ...
     {% endmacro %}
     
Using functions

     {% myfunc(var, 5) %}

