## Preparing Deployment Packages

### Python

To add extra Python modules into the package use "-t <package path>" to install them into the package
  
    pip install <module name> -t <package path>
    pip3 install <module name> -t <package path>

On current Debian/Ubuntu you might get a

    DistutilsOptionError: can't combine user with prefix, exec_prefix/home, or install_(plat)base

in this case add a "--system" switch to your call, e.g.

    pip install <module name> --system -t <package path>

## Import/Export

Import is possible in the code editor (File menu). Export is possible via the global "Actions" menu.

## Misc

- [Lambkin](https://github.com/jarpy/lambkin): CLI helper for creating and uploading lambdas
- [Unused EBS Cleanup](https://codingsans.com/blog/cleanup-unused-ebs-volumes): Lamdba example to cleanup EBS volumes
