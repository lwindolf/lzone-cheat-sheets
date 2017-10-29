See also <?add topic='Ruby Bundler'?>

### Using Gem

    gem env
    gem list
    gem outdated            # List Gems with updates available
    gem update [<name>]
    gem install <name> [-v <version>]
    gem uninstall <name>

### Test with RSpec

    # There are a lot of rspec launch variants:
    autotest
    rspec <path to .rb spec file>
    rspec <path to directory>
    bundle exec rspec <path to .rb spec file>

### Interactive Shell

    $ irb
    irb(main):001:0>

Launch a script interactively:

    irb -r script.rb

Inspect nested data structures:

    puts <something>.inspect

Pretty printing data structures:

    require 'pp'
    pp <some object>

Print as YAML

    y <something>

### Data Types

Debugging

    var.inspect      # prints serialization
    var.to_s    # often prints class

Checking for Undef

    if (defined?(var)).nil?
       puts "undef"
    end

#### Hashes

To merge hashes

    h1.merge(h2)

To get hash keys in order

    h.keys.sort

To get key-value pairs in order

    h.sort.map do |key, value|
        # do something
    end

### I/O

Write file

    File.open('file.txt', 'w') { |file| file.write("text") }

### Misc

-   [YAML Cookbook for Ruby](http://yaml.org/YAML_for_ruby.html)

