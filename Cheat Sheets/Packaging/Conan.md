## CLI

### Package installation

    conan install <path to conanfile.txt>
    conan install --settings build_type=Debug         # Build with debug
     
    conan search -r conancenter <package>
    conan search -r conancenter <path>/*

### Building packages

    conan create <path to recipe>
    conan upload -r [--all] <repo name> <package>
     
    conan inspect --attribute options <library>       # Print option values
     
### Managing repos

    conan user -r <repo name>                         # Login to repo

    conan remote list                                 # List configured repos
    conan remote add <name> <repo URL> False          # Add remote repo
   
Virtual repositories

    conan config set general.revisions_enabled=1
    conan remote add <name> <url> False -F
