This is a cheat sheet for the Jinja templating syntax.

## Syntax

The syntax is somewhat similar to ERB except for {} instead of <> quotes

{% raw %}
     {{ ... }}           # Escaping for expressions that create output
     {% ... %}           # Escaping for control statements
     # ... ##            # Line statements
{% endraw %}

## Loops

{% raw %}
     {% for i in list %} ... {% endfor %}
{% endraw %}

## Functions

Defining functions

{% raw %}
     {% macro myfunct(param1, param2) %}
     ...
     {% endmacro %}
{% endraw %}
     
Using functions

{% raw %}
     {% myfunc(var, 5) %}
{% endraw %}
