---
related:
  cheat-sheet: ['gdb', 'Debugging']
---

## Linking

- Mix Static and Dynamic Linking

        gcc <options> <sources> -o <binary> -Wl,-Bstatic <list of static libs> -Wl,Bdynamic <list of dynamic libs>

- Link all static

        gcc -static ...

- Link libgcc static

        gcc -static-gcc ...

- Partial static linking
  
        gcc ... -Wl,-Bstatic <list of static libs> -Wl,Bdynamic <list of dynamic libs>

## Warnings

- Useful warnings

       -Wall -Wunused -Wextra -Wno-pointer-sign -Wno-unused-parameter

- Static code analysis

       -fanalyzer

## Symbols

Compile with debug symbols

       CFLAGS='-g3 -ggdb -O0' ./configure

## Hardening Options

- Enable stack protection

       -fstack-protector

- Fortify source

       -D_FORTIFY_SOURCE=<1/2>

- Check hardening (Debian):

       hardening-check <binary>

- Dump GCC distribution settings

       gcc -dumpspecs

## Reading List

- [https://matt.sh/howto-c](https://matt.sh/howto-c)
