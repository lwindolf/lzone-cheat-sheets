## Query domain info

    Get-ComputerInfo | Select-Object CsDomain, CsPartOfDomain

## Join domain

    Add-Computer -DomainName my-domain.com -Credential $cred -Restart

## OUs

    New-ADOrganizationalUnit -Name "DepartmentA" -Path "OU=DepA,DC=example,DC=com"

To see a list of all OUs

    Get-ADOrganizationalUnit -Filter * -Properties CanonicalName | 
        Sort-Object CanonicalName | 
        Select-Object CanonicalName
