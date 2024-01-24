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

## Private Package Repo

    (
    cat <<EOT
    export GOPROXY=${PUBLIC_REPO_URL}
    export GOPRIVATE=${PRIVATE_REPO_URL}
    EOT
    ) >>/etc/environment

Note how you can inject Basic auth credentials in both URLs. More details [https://jfrog.com/blog/why-goproxy-matters-and-which-to-pick/](https://jfrog.com/blog/why-goproxy-matters-and-which-to-pick/)

## Package Index

[https://pkg.go.dev/](https://pkg.go.dev/)
