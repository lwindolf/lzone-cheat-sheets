---
related:
  examples: [ 'Python re.match', 'Python re.sub', 'Python re.split', 'Python split']
---

## Using re objects

    pattern = re.compile(<pattern>)        # compile pattern
   
    pattern.search(<string>)               # Checks if pattern matches anywhere in <string>
    pattern.match(<string>)                # Checks if pattern matches the start of <string>
    pattern.sub(<replacement>, <input>)    # replaces all matcges with <replacement> and returns result


## Patterns Examples

    'abc'                 # Matches the literal 'abc'
    r'\w+'                # Matches a word
    r'\d+\s\w+'           # Matches '1555 dogs'
    r'\d+-\d+-\d+\s.+'    # Matches '2005-12-05 Jons birthday'
    r'\s+'                # Matches any number of whitespace

## Using braces and capture groups
    
    'abc(def)ghi'         # Matches the literal 'abcdefghi' and captures 'def' as capture group #1
    r'abc\(def\)ghi'      # Matches the literal 'abc(def)ghi'

For using capture groups in place use re.sub. For extraction use re.search or re.match.
