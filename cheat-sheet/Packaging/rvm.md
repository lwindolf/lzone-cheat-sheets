Manage multiple ruby environments with [RVM](http://rvm.io) (Ruby Version Manager)

### Installation

    curl -sSL https://get.rvm.io | bash -s stable
    source /home/john.smith/.rvm/scripts/rvm
    rvm use --default 1.8.7-p374
    bundle install

### Usage

    rvm list
    rvm list gemsets

    rvm gemset list
    rvm gemset create <name>
    rvm gemset use <name>

    rvm install <Ruby version>

    rvm system  # Select distro Ruby

Install Gem into a version

    rvm <Ruby version> do gem install <gem>

Install bundle with a version

    rvm 1.9.3 do bundle install
