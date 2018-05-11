Glib supports PCRE based regular expressions since v2.14 with the **GRegex** class.

### Usage

<pre class="brush:c">GError *err = NULL;
GMatchInfo *matchInfo;
GRegex *regex;

regex = g_regex_new ("text", 0, 0, &err);
// check for compilation errors here!

g_regex_match (regex, "Some text to match", 0, &matchInfo);
</pre>

Not how g_regex_new() gets the pattern as first parameter without any regex delimiters. As the regex is created separately it can and should be reused.

### Checking if a GRegex did match

Above example just ran the regular expression, but did not test for matching. To simply test for a match add something like this:

<pre class="brush:c">if (g_match_info_matches (matchInfo))
    g_print ("Text found!\n");
</pre>

### Extracting Data

If you are interested in data matched you need to use matching groups and need to iterate over the matches in the GMatchInfo structure. Here is an example (without any error checking):

<pre class="brush:c">regex = g_regex_new (" mykey=(\w+) ", 0, 0, &err);
g_regex_match (regex, content, 0, &matchInfo);

while (g_match_info_matches (matchInfo)) {
   gchar *result = g_match_info_fetch (matchInfo, 0);

   g_print ("mykey=%s\n", result);

   g_match_info_next (matchInfo, &err);
   g_free (result);
}
</pre>

### Easy String Splitting

Another nice feature in Glib is regex based string splitting with g_regex_split() or g_regex_split_simple():

<pre class="brush:c">gchar **results = g_regex_split_simple ("\s+",
       "White space separated list", 0, 0);
</pre>

Use g_regex_split for a precompiled regex or use the "simple" function to just pass the pattern.
