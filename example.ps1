function Get-Data {
    param (
        $ServerName = $Env:COMPUTERNAME,
        $Username = 'test'
    )
    if ($ServerName -eq $Env:COMPUTERNAME) {
        $ComputerInfo = Get-ComputerInfo
        [PSCustomObject]@{
            Name = $Env:COMPUTERNAME
            OS = $ComputerInfo.OSName
            IPAddress = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias 'Ethernet').IPAddress
            Domain = $ComputerInfo.CsDomain
            Model = $ComputerInfo.Model
            Manufacturer = $ComputerInfo.Manufacturer
        }
    }
    else {
        Invoke-Command -ComputerName $ComputerName -ScriptBlock {
            $ComputerInfo = Get-ComputerInfo
            [PSCustomObject]@{
                Name = $Env:COMPUTERNAME
                OS = $ComputerInfo.OSName
                IPAddress = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias 'Ethernet').IPAddress
                Domain = $ComputerInfo.CsDomain
                Model = $ComputerInfo.Model
                Manufacturer = $ComputerInfo.Manufacturer
            }
        }
    }
}
