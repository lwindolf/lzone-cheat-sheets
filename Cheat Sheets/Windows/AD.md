## Query domain info

    Get-ComputerInfo | Select-Object CsDomain, CsPartOfDomain

    Test-ComputerSecureChannel
    Test-ComputerSecureChannel -Repair

Get a detailed join state summary

    dsregcmd /status

## Join domain

    Add-Computer -DomainName my-domain.com -Credential $cred -Restart


## AD users

    Get-ADUser -Filter 'Name -like ".*Smith.*"' | Format-Table Name,SamAccountName -A
    Get-ADUser -Identity <objectGuid> -Property departmentNr
    Set-ADUser -Identity <objectGuid> -Add @{extensionAttribute1="abc"}
    Set-ADUser -Identity <objectGuid> -Replace @{extensionAttribute1="def"}
    Set-ADUser -Identity <objectGuid> -Clear extensionAttribute1

## OUs

    New-ADOrganizationalUnit -Name "DepartmentA" -Path "OU=DepA,DC=example,DC=com"

To see a list of all OUs

    Get-ADOrganizationalUnit -Filter * -Properties CanonicalName | 
        Sort-Object CanonicalName | 
        Select-Object CanonicalName
