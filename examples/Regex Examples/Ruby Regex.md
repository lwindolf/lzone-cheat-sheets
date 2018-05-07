Some simple examples for using regular expressions in Ruby scripts.

## Regular Expressions

### 1\. Syntax

Compared to other scripting languages Ruby more behaves like [Perl](Perl) allowing to use regex seemlessly without the need for explicit objects in Python or a function in PHP. So you can just match something with putting a regular expression between two slashes:

<pre class="brush:php">/search string/</pre>

### 2\. Simple String Checks

Here are some syntax examples that check strings for certain content:

#### Basic Matching

<pre class="brush:php">text =~ /Ruby/       # Match for an unbound literal
text =~ /^Ruby/      # Match literal at start of string
text =~ /Ruby$/      # Match literal at end of string
text =~ /^Ruby$/     # Match for exact string content
text =~ /^$/         # Match empty string
</pre>

#### Using different regex delimiters

<pre class="brush:php">%r/Ruby/               # / as commonly used delimiter
%r@Ruby@               # @ as delimiter
%r!Ruby!               # ! as delimiter
</pre>

#### Changing the delimiter becomes useful in some cases

<pre class="brush:php">"http://" =~ /http:\/\//     # match http:// protocol prefix with / delimiter
"http://" =~ %r#http://#     # match http:// protocol prefix with # delimiter
</pre>

#### Case sensitity

<pre class="brush:php">text =~ /Ruby/                # case sensitive string matching
text =~ /ruby/i               # case in-sensitive string matching
</pre>

#### Matching with wildcards

<pre class="brush:php">"Ruby" =~ /R..y/            # match a single character with .
"Ruby" =~ /R.*y/            # match multipe characters
"Ruby" =~ /R[a-z]y/         # match from character range a-z
"Rbuy" =~ /[Ruby]*/         # match from character set R,u,b and y
"Ruby" =~ /R\wy/            # match one word character
"regex in Ruby" =~ /\bRuby\b/"   # match the word "Ruby", but not "Ruby" as larger string
</pre>

#### Using quantifiers

<pre class="brush:php">"Ruby" =~ /[Ruby]{4}/          # match exactly 4 characters from set [Ruby]
"Ruby" =~ /[Ruby]{4,4}/        # match exactly 4 characters from set [Ruby]
"Ruby" =~ /[Ruby]{,3}/         # match at most 3 characters from set [Ruby]
"Ruby" =~ /[Ruby]{3,}/         # match at least 3 characters from set [Ruby]
</pre>

### 3\. Replacing Patterns

You need to do substitution using the in place string object methods sub!() for replacing first occurence and gsub!() for replacing all occurences:

<pre class="brush:php">text.sub!(/Rbuy/, "Ruby")</pre>

### 4\. Capture Groups

To extract data using regular expression we have to use capture/grouping syntax and

*   **to do exactly one match:** the String#match method and MatchData#captures to produce a result array
*   **to do multiple matches:** the String#scan method which returns a nested array with an result array for each match

Some basic examples to do the exactly one match with String#match

<pre class="brush:php"># Extract everything after the literal "START"
if result = line.match(/START(.*)/")
   text = result.captures
end
</pre>

<pre class="brush:php"># Extract the number from a date string "2012-10-20"
if result = line.match(/(\d{4})-(\d{2})-(\d{2})/)
  year, week, day = result.captures
end
</pre>

<pre class="brush:php"># Nesting of capture groups, extract full name, and both parts... string "name is Doe, John"
if result = line.match(/name is ((\w+), (\w+))/)
  fullname, firstname, lastname = result.capture
end
</pre>

Ensure always to check for nil result if the match might fail!
