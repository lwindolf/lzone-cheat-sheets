
## Pretty-print XML

    xmllint --format my.xml

## XPath on the command line

Print subtree of tag 'sometag'

    xmllint --xpath "//sometag" data.xml
    
Match an attribute 'someattr' of 'sometag' to have literal 'string'

    xmllint --xpath "//sometag[contains(@someattr, 'string')" data.xml
