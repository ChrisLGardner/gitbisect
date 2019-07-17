function Get-Data {
    param (
        $ServerName = $Env:COMPUTERNAME
    )
    if ($ServerName -eq $Env:COMPUTERNAME) {
        [PSCustomObject]@{
            Name = $Env:COMPUTERNAME
            OS = (Get-ComputerInfo).OSName
            IPAddress = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias 'Ethernet').IPAddress
            Domain = (Get-ComputerInfo).CsDomain
            Model = (Get-ComputerInfo).Model
            Manufacturer = (Get-ComputerInfo).Manufacturer
        }
    }
    else {
        Invoke-Command -ComputerName $ComputerName -ScriptBlock {
            [PSCustomObject]@{
                Name = $Env:COMPUTERNAME
                OS = (Get-ComputerInfo).OSName
                IPAddress = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias 'Ethernet').IPAddress
                Domain = (Get-ComputerInfo).CsDomain
                Model = (Get-ComputerInfo).Model
                Manufacturer = (Get-ComputerInfo).Manufacturer
            }
        }
    }
}
