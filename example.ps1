function Get-Data {
    [PSCustomObject]@{
        Name = $Env:COMPUTERNAME
        OS = (Get-ComputerInfo).OSName
        IPAddress = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias 'Ethernet').IPAddress
        Domain = (Get-ComputerInfo).CsDomain
        Model = (Get-ComputerInfo).Model
        Manufacturer = (Get-ComputerInfo).Manufacturer
    }
}
