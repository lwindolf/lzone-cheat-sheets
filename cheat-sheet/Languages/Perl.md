## Basic Functions, Operators, Regex

Have a look at [https://www.pcwdld.com/perl-cheat-sheet](https://www.pcwdld.com/perl-cheat-sheet)

## Installing Modules from CPAN

Invoke CPAN shell

    perl -MCPAN -e shell 

Install a module

    cpan[1]> install Some::Package

List CPAN installed modules

    $ cpan -l

## Catching exceptions

    eval {
       // your code which might die()
       1;
    } or do {
       warn("Failed: $_");
    };

## UTF-8 CGI Handling

From [Proper UTF-8 CGI handling](http://blog.thewebsitepeople.org/2012/06/perl-default-to-utf-8-encoding/):

        use utf8;
        use open ( ":encoding(UTF-8)", ":std" );
        use CGI ("-utf8");

## Daemonizing in Perl

From [Always double fork](http://world.std.com/~swmcd/steven/tech/daemon.html):

        use POSIX;

        sub daemonize
        {
            fork and exit;
            POSIX::setsid();
            fork and exit;
            umask 0;
            chdir '/';
            close STDIN;
            close STDOUT;
            close STDERR;
        }
        
## JSON+XPath

Ad-hoc JSON filtering with XPath

        lwp-request https://example.com/api-endpoint | perl -MJSON::XS -MData::DPath=dpath -E 'say join(",", dpath("//status")->match(decode_json(join("",<STDIN>))))'

## Debugging

### Value Debugging in Perl

This is usually done with Data::Dumper

        use Data::Dumper;

        # long form
        print Data::Dumper->Dump([$var], [qw(var)]);   # scalar variable
        print Data::Dumper->Dump([$var]);              # scalar variable without name

        # short form
        print Dumper(\@var);           # array variable
        print Dumper(%var);            # hash as simple list
        print Dumper(\%var);           # hash nicely indented
        print Dumper($var);            # arbitrary reference


### Performance Debugging in Perl

nyprof is a good debugger that supports flame graphs and a very useful static HTML client. To create HTML from a trace

    nytprofhtml --file trace.out --open trace.out --out result

To run CGIs with ad-hoc request parameters

    QUERY_STRING='<some query>' REQUEST_METHOD=GET REMOTE_USER=<user> perl -d:NYTProf <cgi script>

## Misc
        
- Case-insensitive sorting

       sort { "\L$a" cmp "\L$b" } @mylist

- Regex - Always use named capture groups and %+, for example:

        if($str =~ /(?<field1>\w+)\s+(?<field2>\w+)(\s+(?<field3>\w+))?/) {
              %result = %+;
        }

- Perl - Random Values:

        int(rand(10))


- Perl - Fix for "perl: warning: Setting locale failed."

        locale-gen en_US.UTF-8   # Insert listed locale(s)
