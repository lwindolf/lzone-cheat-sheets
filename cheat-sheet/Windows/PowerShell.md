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

## Exceptions

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

## File name handling

    $filename = Join-Path $directory 'some.exe'

## Execution Policies

    Set-ExecutionPolicy Bypass -Scope Process -Force
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

## Download by URL

    iwr -useb http://example.com/somefile
    iwr -useb http://example.com/someexe | iex       # Download and execute it
