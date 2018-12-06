## Links

-   [YAML 1.2 Spec](http://www.yaml.org/spec/1.2/spec.html)
-   [Online YAML Linter (Ruby)](http://www.yamllint.com/)
-   [Online YAML Parser
    (Python)](http://yaml-online-parser.appspot.com/)
-   [kwalify - YAML schema validator
    (Ruby)](http://www.kuwata-lab.com/kwalify/)

## YAML Syntax Examples

### YAML Scalars

Scalar types

    a: 1        # integer          
    a: 1.234    # float      
    b: 'abc'    # string        
    b: "abc"                   
    b: abc                     
    c: false    # boolean type 
    d: 2015-04-05   # date type
                                 
Enforcing strings

    b: !str 2015-04-05

### YAML Sequences

#### Simple sequence

     array:
       - 132
       - 2.434
       - 'abc'

#### Sequence of sequences

     my_list_of_lists:
       - [1, 2, 3]
       - [4, 5, 6]
       
### YAML Hashes

Nested hash

     my_hash:
       subkey:
         subsubkey1: 5
         subsubkey2: 6
       another:
         somethingelse: 'Important!'
         
Hash with JSON syntax (mixing is possible)

     my_hash: {nr1: 5, nr2: 6}
     
### YAML HereDoc

_Block notation_: Newlines become spaces

    content:
       Arbitrary free text
       over multiple lines stopping only
       after the indentation changes...

_Literal style_: Newlines are preserved

    content: |
       Arbitrary free text            
       over "multiple lines" stopping 
       after indentation changes...   
                                      
_+ indicator_: Keep extra newlines after the block

    content: |+                      
       Arbitrary free text with newlines after
       
    
_- indicator_: remove extra newlines after block

    content: |-
       Arbitrary free text without newlines after it

_folded style_: folded newlines are preserved

     content: >
       Arbitrary free text
       over "multiple lines" stopping
       after indentation changes...

### Multiple Documents

A YAML file can have multiple documents, this is why every document needs to start with a "---" line

     ---
     content: doc1
     ---
     content: doc2

This also means YAML parsers might return multiple documents!

### Content References (Aliases)

     ---
     values:
       - &ref Something to reuse
       - *ref      # Literal "Something to reuse" is inserted here!
       
### Merging Keys

Imaging some default properties for a hash like these

     default_settings:
       install:
         dir: /usr/local
         owner: root
       config:
         enabled: false

Use them in another hash using "<<: *reference"

     # Derive settings for 'my_app' from default and change install::owner
     # and add further setting "group: my_group"
     
     my_app_settings:
       <<: *default_settings
       install:
         owner: my_user
         group: my_group


### Complex Mapping

     ---                              
     ? - key                          
     :                                
       - value                        

Note: key and value can be multiple, complex structures that you could not realize with the hash syntax!



