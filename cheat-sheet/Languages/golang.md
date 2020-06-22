## Setup

    apt install golang
    apt install golang-golang-x-tools   # For stuff like goimports

## CLI

    go build <source file>
    go get <module>
    go get -u                   # Update all dependencies
    
    go generate
    
    goimports -w .              # Install dependencies

## Multiple Go Versions

    go get golang.org/dl/go1.14.4      # Install version installer
    ~/go/bin/go1.14.4 download         # Download go version

Now you can use the new version directly

    ~/go/bin/go1.14.4

or alias it

    alias go=~/go/bin/go1.14.4

## Package Index

https://pkg.go.dev/
