## Simple node selection

Simple XPath expressions you can use a beginner

    //article         # find all <article> tags
    //article/h1      # find all <h1> tags directly below an <article>
    
    //a/@href         # find all href attributes of <a> tags

    //span[@class='someclass']        # find all <span> with class set to 'someclass'
    (//span[@class='someclass'])[2]   # get the 2nd <span> of this class only
   
    //input[@class='someclass' and @name='searchtext']   # find by multiple attributes

## Get node contents

All those expressions return nodes. When you directly want to access a nodes content do use **text()**

    //article/text()

## Using functions when matching

To match attribute text use **contains()**

    //a[contains(@href, 'https')]       # Get all HTTPS links

To do negative matches use **not()**

    //a[not(contains(@href, 'https')]   # Get all non-HTTPS links
    
To count nodes use **count()**

    count(//articles/h2)

To match result length use **string-length()**

    //a[string-length(@href) > 55]
    
For partially matches **starts-with()**

    //a[starts-with(@href, '/blog')]
    
## Use arithmetic functions

You can do calculations using the functions **sum()**, **ceiling()**, **round()**, **min()**, **max()**

    sum(//people/@age)                                  # Total age of all people
    ceiling((sum(//people/@weight)/count(//people)))    # Avg weight rounded

Note: The following examples are only usable with XSLT 2.0

    min(//people/@weight)                               # Min weight
    max(//people/@weight)                               # Max weight
    sum(//articles/(@sold + @in_stock))
    
which for each article would sum first the attributes 'sold' and 'stock' and then sum up all articles together.

## Axis Navigation

To do node relative lookups you can apply a so called 'axis' to the current node. Examples

    child::span               # Select all childs that are <span>s
    descendant::span          # Select all <span>s that are descendants
    ancestor::span            # Select all <span>s that are ancestors
    ancestor-or-self::span    # Select all <span>s that are ancestors and the current node if it is a <span>
    following::span           # Select following node of type <span>
    following-silbling::span  # Select following node of type <span>
    preceding::span           # Select preceding node of type <span> (but not ancestors, attributes and namespaces)
    peceding-sibling::span    # Select all siblings before this node
    attribute::lang           # Select the @lang attribute
    
    namespace                 # Other axis'es
    parent
    self

Instead of passing a name (like 'span' and 'lang' above) you can also pass '*' to match all nodes along the axis

    child::*
    attribute::*
    descendant::*
    [...]

And also extract node sets and text content

    child::text()          # Get all text content of all child nodes
    child::node()          # Get a node set of all child nodes
