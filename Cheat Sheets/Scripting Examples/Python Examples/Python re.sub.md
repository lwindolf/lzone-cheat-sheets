---
related:
  examples: [ 'Python re.match', 'Regex Overview']
---

## Syntax

    import re
   
    result = re.sub(pattern, repl, string, count=0, flags=0);

## Simple Examples

    result = re.sub('abc',  '',    input)           # Delete pattern abc
    result = re.sub('abc',  'def', input)           # Replace pattern abc -> def
    result = re.sub(r'\s+', ' ',   input)           # Eliminate duplicate whitespaces using wildcards
    result = re.sub('abc(def)ghi', r'\1', input)    # Replace a string with a part of itself

<b>Note:</b> Take care to always prefix patterns containing \ escapes with raw strings (by adding an r in front of the string). Otherwise the \ is used as an escape sequence and the regex won't work.

## Advance Usage

### Replacement Function

Instead of a replacement string you can provide a function performing dynamic replacements based on the match string like this:

    def my_replace(m):
        if <some condition>:
            return <replacement variant 1>
        return <replacement variant 2>
    
    result = re.sub("\w+", my_replace, input)

### Count Replacements

When you want to know how many replacements did happen use re.subn() instead of re.sub()

    print ('Result: ', result[0])
    print ('Replacements: ', result[1])

### Using Backreferences

#### Numeric Backreferences

To use back reference define capture groups using () and reference to those using \1, \2, and so on. <b>Do not forget the 'r' prefix on the
back reference string, otherwise \1 will be interpreted as a character.</b>

    result = re.sub("(\d+) (\w+)", r"\2 \1")

#### Named Backreferences

For named backreferences define a named capture group (?<name>) and 
reference using \g<name>. Again ensure to add the 'r' prefix on the
backreference string.

    result = re.sub("(?<number>\d+) (?<word>\w+)", r"\g<word> \g<number>")

