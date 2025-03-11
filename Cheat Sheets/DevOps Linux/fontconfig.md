## CLI

    fc-list : file           # Print all font files known from cache
    
    fc-cache -f              # Force build cache
    fc-cache -f -v           # Same with debug output

When you only want to work with specific paths

    chmod -R 0755 <path>     # Ensure to make directory writable
    fc-cache -f <path>       # Create cache for only the given directory

## Misc

- [RHEL7 Admin Guide fontconfig](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/7/html/desktop_migration_and_administration_guide/configure-fonts#using-alternative-directories-for-all-users)
