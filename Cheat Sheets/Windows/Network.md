## DNS

    Get-DnsClientServerAddress         # all DNS configs for all interfaces

    # set new DNS for all active adapters
    Get-NetAdapter | Where-Object Status -eq "Up" | Set-DnsClientServerAddress -ServerAddresses (<ip>)

## Connection testing

    Test-NetConnection -ComputerName "<hostname>" -Port <port>
