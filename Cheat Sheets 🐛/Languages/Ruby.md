---
related: 
   cheat-sheet: ['Ruby Bundler', 'gem']
---

## Test with RSpec

    # There are a lot of rspec launch variants:
    autotest
    rspec <path to .rb spec file>
    rspec <path to directory>
    bundle exec rspec <path to .rb spec file>

## Interactive Shell

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

## Data Types

Debugging

    var.inspect      # prints serialization
    var.to_s    # often prints class

Checking for Undef

    if (defined?(var)).nil?
       puts "undef"
    end

### Arrays

    arr = []
    arr.push("a")
    arr.pop()
    arr.insert(0, "b")    # Add b at index 0
    arr.insert(-1, "c")   # Add c at the end
    arr << "c"            # Add c at the end

Accessing ranges

    arr[3:4]        # 4th and 5th element
    arr[1000:-1]    # Everything starting at 1001 element to the end
   
Iterating arrays

    array.each do |value|
        # do something
    end   

### Hashes

To merge hashes

    h1.merge(h2)

To get hash keys in order

    h.keys.sort

To get key-value pairs in order

    h.sort.map do |key, value|
        # do something
    end

## I/O

Write file

    File.open('file.txt', 'w') { |file| file.write("text") }

### Misc

-   [YAML Cookbook for Ruby](http://yaml.org/YAML_for_ruby.html)

