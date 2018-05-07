## Syntax

![Perl Regex Reference](/images/perl-regex-cheat-sheet.svg "Perl Regex Reference")

## Misc

- [Bad and Good Extraction using Regular Expressions](https://lzone.de/blog/Bad+and+Good+Extraction+with+Regular+Expressions+in+Perl)


       # Always use named capute groups and %+, for example:
       if($str =~ /(?&lt;field1>\w+)\s+(?&lt;field2>\w+)(\s+(?&lt;field3>\w+))?/) {
           %result = %+;
       }
