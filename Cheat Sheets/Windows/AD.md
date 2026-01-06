## Query domain info

    Get-ComputerInfo | Select-Object CsDomain, CsPartOfDomain

## Join domain

    Add-Computer -DomainName my-domain.com -Credential $cred -Restart
