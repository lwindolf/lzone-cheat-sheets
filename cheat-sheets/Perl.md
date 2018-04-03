## Syntax

![](/images/perl-language-overview.svg)

You can also download the cheat sheet as
[PDF](/upload/perl-regex-reference.pdf)!

## Installing Modules from CPAN

Invoke CPAN shell

    perl -MCPAN -e shell 

Install a module

    cpan[1]> install Some::Package

List CPAN installed modules

    $ cpan -l

## Misc

-   [Proper UTF-8 CGI
    handling](http://blog.thewebsitepeople.org/2012/06/perl-default-to-utf-8-encoding/)

        use utf8;
        use open ( ":encoding(UTF-8)", ":std" );
        use CGI ("-utf8");

-   Daemonize - [Always double
    fork](http://world.std.com/~swmcd/steven/tech/daemon.html):

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

-   Regex - Always use named capture groups and %+, for example:

        if($str =~ /(?<field1>\w+)\s+(?<field2>\w+)(\s+(?<field3>\w+))?/) {
              %result = %+;
        }

-   Perl - Random Values:

        int(rand(10))

-   Perl - Value Dumping

        use Data::Dumper;

        # long form
        print Data::Dumper->Dump([$var], [qw(var)]);   # scalar variable
        print Data::Dumper->Dump([$var]);              # scalar variable without name

        # short form
        print Dumper(\@var);           # array variable
        print Dumper(%var);            # hash as simple list
        print Dumper(\%var);           # hash nicely indented
        print Dumper($var);            # arbitrary referenc

-   Perl - Fix for "perl: warning: Setting locale failed."

        locale-gen en_US.UTF-8   # Insert listed locale(s)

-   Ad-hoc JSON filtering with XPath

        lwp-request https://icc.eu.idealo.com/status/check | perl -MJSON::XS -MData::DPath=dpath -E 'say join(",", dpath("//status")->match(decode_json(join("",<STDIN>))))'


