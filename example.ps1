function Get-Data {
    [PSCustomObject]@{
        Name = $Env:COMPUTERNAME
        OS = (Get-ComputerInfo).OSName
        IPAddress = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias 'Ethernet').IPAddress
        Domain = (Get-ComputerInfo).CsDomain
    }
}
