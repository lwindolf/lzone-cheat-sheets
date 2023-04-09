## Syntax

    $result = date(&lt;format>);

## Format Examples

    date("c")			# ISO 8601 date "2015-12-01T16:00+00:00
    date("r")			# RFC 2822 date "Thu, 29 Jan 2099 10:11:00 +0100"
    date("U")			# Unix timestamp
    date('l jS \of F Y h:i:s A')	# Friday 13th of March 2015 08:35:01 PM
    date("Y-m-d H:i:s")		# 2015-03-13 08:35:01
    date("m/d/y");			# 05/02/2015
    date("H:M:S");			# 20:01:59


Since PHP 5.2 there are predefined constants you can use:

    date(DATE_ISO8601)		# "2015-03-13T20:38:00+0100"
    date(DATE_RFC2822)		# "Fri, 13 Mar 2015 20:41:22 +0100"
    date(DATE_RFC822)		# "Fri, 13 Mar 15 20:41:41 +0100"
    date(DATE_RFC850)		# "Friday, 13-Mar-15 20:38:00"
    date(DATE_COOKIE)		# "Friday, 13-Mar-15 20:38:00 CET"


## Format Codes

Citation from the [PHP documentation](http://php.net/manual/en/function.date.php):

<table class="doctable table">

 <thead>
  <tr>
   <th><code class="parameter">Character</th>
   <th>Description</th>
   <th>Example</th>
  </tr>

 </thead>

 <tbody class="tbody">
  <tr>
   <td style="text-align: center;"><em class="emphasis">Day</td>
   <td>---</td>
   <td>---</td>
  </tr>

  <tr>
   <td>d</td>
   <td>Day of the month, 2 digits with leading zeros</td>
   <td>01 to 31</td>
  </tr>

  <tr>
   <td>D</td>
   <td>A textual representation of a day, three letters</td>
   <td>Mon through Sun</td>
  </tr>

  <tr>
   <td>j</td>
   <td>Day of the month without leading zeros</td>
   <td>1 to 31</td>
  </tr>

  <tr>
   <td>l (lowercase 'L')</td>
   <td>A full textual representation of the day of the week</td>
   <td>Sunday through Saturday</td>
  </tr>

  <tr>
   <td>N</td>
   <td>ISO-8601 numeric representation of the day of the week (added in
   PHP 5.1.0)</td>
   <td>1 (for Monday) through 7 (for Sunday)</td>
  </tr>

  <tr>
   <td>S</td>
   <td>English ordinal suffix for the day of the month, 2 characters</td>
   <td>
    st, nd, rd or
    th.  Works well with j
   </td>
  </tr>

  <tr>
   <td>w</td>
   <td>Numeric representation of the day of the week</td>
   <td>0 (for Sunday) through 6 (for Saturday)</td>
  </tr>

  <tr>
   <td>z</td>
   <td>The day of the year (starting from 0)</td>
   <td>0 through 365</td>
  </tr>

  <tr>
   <td style="text-align: center;"><em class="emphasis">Week</td>
   <td>---</td>
   <td>---</td>
  </tr>

  <tr>
   <td>W</td>
   <td>ISO-8601 week number of year, weeks starting on Monday (added in PHP 4.1.0)</td>
   <td>Example: 42 (the 42nd week in the year)</td>
  </tr>

  <tr>
   <td style="text-align: center;"><em class="emphasis">Month</td>
   <td>---</td>
   <td>---</td>
  </tr>

  <tr>
   <td>F</td>
   <td>A full textual representation of a month, such as January or March</td>
   <td>January through December</td>
  </tr>

  <tr>
   <td>m</td>
   <td>Numeric representation of a month, with leading zeros</td>
   <td>01 through 12</td>
  </tr>

  <tr>
   <td>M</td>
   <td>A short textual representation of a month, three letters</td>
   <td>Jan through Dec</td>
  </tr>

  <tr>
   <td>n</td>
   <td>Numeric representation of a month, without leading zeros</td>
   <td>1 through 12</td>
  </tr>

  <tr>
   <td>t</td>
   <td>Number of days in the given month</td>
   <td>28 through 31</td>
  </tr>

  <tr>
   <td style="text-align: center;"><em class="emphasis">Year</td>
   <td>---</td>
   <td>---</td>
  </tr>

  <tr>
   <td>L</td>
   <td>Whether it's a leap year</td>
   <td>1 if it is a leap year, 0 otherwise.</td>
  </tr>

  <tr>
   <td>o</td>
   <td>ISO-8601 year number. This has the same value as
    Y, except that if the ISO week number
    (W) belongs to the previous or next year, that year
    is used instead. (added in PHP 5.1.0)</td>
   <td>Examples: 1999 or 2003</td>
  </tr>

  <tr>
   <td>Y</td>
   <td>A full numeric representation of a year, 4 digits</td>
   <td>Examples: 1999 or 2003</td>
  </tr>

  <tr>
   <td>y</td>
   <td>A two digit representation of a year</td>
   <td>Examples: 99 or 03</td>
  </tr>

  <tr>
   <td style="text-align: center;"><em class="emphasis">Time</td>
   <td>---</td>
   <td>---</td>
  </tr>

  <tr>
   <td>a</td>
   <td>Lowercase Ante meridiem and Post meridiem</td>
   <td>am or pm</td>
  </tr>

  <tr>
   <td>A</td>
   <td>Uppercase Ante meridiem and Post meridiem</td>
   <td>AM or PM</td>
  </tr>

  <tr>
   <td>B</td>
   <td>Swatch Internet time</td>
   <td>000 through 999</td>
  </tr>

  <tr>
   <td>g</td>
   <td>12-hour format of an hour without leading zeros</td>
   <td>1 through 12</td>
  </tr>

  <tr>
   <td>G</td>
   <td>24-hour format of an hour without leading zeros</td>
   <td>0 through 23</td>
  </tr>

  <tr>
   <td>h</td>
   <td>12-hour format of an hour with leading zeros</td>
   <td>01 through 12</td>
  </tr>

  <tr>
   <td>H</td>
   <td>24-hour format of an hour with leading zeros</td>
   <td>00 through 23</td>
  </tr>

  <tr>
   <td>i</td>
   <td>Minutes with leading zeros</td>
   <td>00 to 59</td>
  </tr>

  <tr>
   <td>s</td>
   <td>Seconds, with leading zeros</td>
   <td>00 through 59</td>
  </tr>

  <tr>
   <td>u</td>
   <td>
    Microseconds (added in PHP 5.2.2). Note that
    <span class="function"><strong>date()</strong></span> will always generate
    000000 since it takes an <span class="type">integer</span>
    parameter, whereas <span class="methodname">DateTime::format()</span> does
    support microseconds.
   </td>
   <td>Example: 654321</td>
  </tr>

  <tr>
   <td style="text-align: center;"><em class="emphasis">Timezone</td>
   <td>---</td>
   <td>---</td>
  </tr>

  <tr>
   <td>e</td>
   <td>Timezone identifier (added in PHP 5.1.0)</td>
   <td>Examples: UTC, GMT, Atlantic/Azores</td>
  </tr>

  <tr>
   <td>I (capital i)</td>
   <td>Whether or not the date is in daylight saving time</td>
   <td>1 if Daylight Saving Time, 0 otherwise.</td>
  </tr>

  <tr>
   <td>O</td>
   <td>Difference to Greenwich time (GMT) in hours</td>
   <td>Example: +0200</td>
  </tr>

  <tr>
   <td>P</td>
   <td>Difference to Greenwich time (GMT) with colon between hours and minutes (added in PHP 5.1.3)</td>
   <td>Example: +02:00</td>
  </tr>

  <tr>
   <td>T</td>
   <td>Timezone abbreviation</td>
   <td>Examples: EST, MDT ...</td>
  </tr>

  <tr>
   <td>Z</td>
   <td>Timezone offset in seconds. The offset for timezones west of UTC is always
   negative, and for those east of UTC is always positive.</td>
   <td>-43200 through 50400</td>
  </tr>

  <tr>
   <td style="text-align: center;"><em class="emphasis">Full Date/Time</td>
   <td>---</td>
   <td>---</td>
  </tr>

  <tr>
   <td>c</td>
   <td>ISO 8601 date (added in PHP 5)</td>
   <td>2004-02-12T15:19:21+00:00</td>
  </tr>

  <tr>
   <td>r</td>
   <td>RFC 2822</td>
   <td>Example: Thu, 21 Dec 2000 16:01:07 +0200</td>
  </tr>

  <tr>
   <td>U</td>
   <td>Seconds since the Unix Epoch (January 1 1970 00:00:00 GMT)</td>
   <td>See also time()</td>
  </tr>

 </tbody>

</table>

## High Resolution

    echo date('u');		# always gives "0000000", don't use!
    echo microtime();	# gives Unix timestamp in [ms]

