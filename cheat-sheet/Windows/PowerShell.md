## Condition Examples

    if ((-not [string]::IsNullOrEmpty($string)))
    if (($nr > 5) -and ($string eq ''))

## Control Flow

    switch ($exitCode) {
        0 { break }
        1 { throw "Error!" }
        2 { throw "Another error!" }
        default { throw "That's unexpected!" }
    }

### Exceptions

    try {
       throw "My exception";
    } catch {
       Write-Output "Caught exception!";
    }

## Functions

    function My-Function {
       param (
       [string]$param1,
       [string]$param2
       )
       
       # Code comes here
    }
    
## Env Variables

    $tmp =  $env:SOME_ENV_VAR;
    
    $env:Path = [Environment]::GetEnvironmentVariable('Path',[System.EnvironmentVariableTarget]::Machine);
    

## Filesystem

Building a filename

    $filename = Join-Path $directory 'some.exe'
    
Checking for a file

    if (!(Test-Path $myfile -PathType Leaf)) {
    }

Create directory

    New-Item "$mydir" -ItemType Directory -Force
    
Removing files/directories

    Remove-Item "$somepath" -Force -Recurse
    
## Execution Policies

    Set-ExecutionPolicy Bypass -Scope Process -Force
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

## Download by URL

    iwr -useb http://example.com/somefile
    iwr -useb http://example.com/someexe | iex       # Download and execute it

## Check PowerShell Version

    if ($PSVersionTable.PSVersion.Major -lt 5) {
        # ...
    }
    
## Using a proxy

    $env:https_proxy='<server>:<port>'
