First import the regexp package

    import regexp

## Matching

    match, _ := regexp.MatchString("[a-zA-Z0-9]+", input)

match will be true if the pattern matches. To return the first match as string use

    matchstr := regexp.FindString("([a-zA-Z0-9]+)", input)

To return all matches:

    matches := regexp.FindAllString("([a-zA-Z0-9]+)", input)

## Matching Methods

There are different matching methods

<table border="1">
<tr><th>Method</th><th>Description</th><th>Signature</th></tr>
<tr>
	<td>Match</td>
	<td>Test a string for matching a byte slice</td>
	<td><pre>func Match(pattern string, b []byte) (matched bool, err error)</pre></td>
</tr>
<tr>
	<td>MatchString</td>
	<td>Test a string for match another string</td>
	<td><pre>func MatchString(pattern string, s string) (matched bool, err error)</pre></td>
</tr>
<tr>
	<td>Find<br/>
FindIndex<br/>
FindSubmatch<br/>
FindSubmatchIndex</td>
	<td>Find first byte slices match and return it</td>
	<td><pre>func (re *Regexp) Find(b []byte) []byte
func (re *Regexp) FindIndex(b []byte) (loc []int)
func (re *Regexp) FindSubmatch(b []byte) [][]byte
func (re *Regexp) FindSubmatchIndex(b []byte) []int</pre></td>
</tr>
<tr>
	<td>
FindString<br/>
FindStringIndex<br/>
FindStringSubmatch<br/>
FindStringSubmatchIndex</td>
	<td>Find first string match and return it</td>
	<td><pre>func (re *Regexp) FindString(s string) string
func (re *Regexp) FindStringIndex(s string) (loc []int)
func (re *Regexp) FindStringSubmatch(s string) []string
func (re *Regexp) FindStringSubmatchIndex(s string) []int</pre></td>
</tr>
<tr>
	<td>FindAll<br/>
FindAllIndex<br/>
FindAllString<br/>
FindAllStringIndex<br/>
FindAllStringSubmatch<br/>
FindAllStringSubmatchIndex<br/>
</td>
	<td>Like the Find/FindString methods, just returning all matches</td>
	<td>Like the Find/FindString methods, just returning arrays of matches</td>
</tr>
</table>

## Replacing

To replace text use ReplaceAll or ReplaceAllString

    func (re *Regexp) ReplaceAll(src, repl []byte) []byte
    func (re *Regexp) ReplaceAllString(src, repl string) string

e.g.

    result := regexp.Compile("\s+").ReplaceAllString(input, " ")

to collapse all whitespaces

## Precompiled expressions

Create expression with

    r, _ := regexp.Compile("[a-zA-Z0-9]+")

and use it in method form

    r.MatchString(input)
