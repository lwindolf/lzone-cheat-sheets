This page is primarily about how to utilize WinRM for test environments

## Test wether WinRM is enabled

On local machine

    Get-Service WinRM                     # check if service is running
    dir WSMan:\localhost\Listener         # check if port is open

From DC

    Test-WSMan -ComputerName <computer>   # check if WinRM responds

## Script WinRM from Linux

Simply python3 script to run commands:

    import winrm
    import sys

    session = winrm.Session(sys.argv[1], auth=(sys.argv[2], sys.argv[3])
    result = session.run_ps(sys.stdin.read())
    print(r.std_out)
    print(r.std_err)

When running complex scripts copy a .ps1 file first and run it using above script

   smbclient '//<IP>/C$' -U "<user>%<password>" -c "put script.ps1 script.ps1"
