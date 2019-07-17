Describe "Testing Get-Data function" {
    BeforeAll {
        Mock -CommandName Invoke-Command -MockWith {}
        Mock -CommandName Get-ComputerInfo -MockWith {}
    }

    It "Should call Invoke-Command with the computer name" {
        .\example.ps1 "NotARealComputer"

        Assert-MockCalled -CommandName Invoke-Command -ParameterFilter {
            $ComputerName -eq 'NotARealComputer'
        }
    }
}
