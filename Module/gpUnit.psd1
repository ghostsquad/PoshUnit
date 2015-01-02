<#############################################################################
The GravityPS-Unit (gpUnit) module is a testing framework for Powershell, built using the GravityPS framework.

The MIT License (MIT)

Copyright (c) 2014 Wes McNamee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
#############################################################################>

@{
      ModuleToProcess = 'gpUnit.psm1'

        ModuleVersion = '0.1.0'

                 GUID = '0EFA071E-502B-4AF5-924F-EE9237357B46'

               Author = 'Weston McNamee'

          CompanyName = 'GhostSquad'

            Copyright = 'Copyright 2014 Weston McNamee'

          Description = 'The GravityPS-Unit (gpUnit) module is a testing framework for Powershell, built using the GravityPS framework.'

    PowerShellVersion = '3.0'

         NestedModules = @(
                        'PSCX'
                        'GravityPS'
                        'gpClass'
                        )

      FunctionsToExport = @(
                        'Fixture'
                        'Get-Tests'
                        'Get-TestSession'
                        'New-PSClassFromTestFixture'
                        'Remove-TestSession'
                        'Start-TestSession'
                        )

             FileList = @(
                        'LICENSE'
                        'gpUnit.psd1'
                        'gpUnit.psm1'
                        'functions\Fixture'
                        'functions\Get-Tests'
                        'functions\Get-TestSession'
                        'functions\New-PSClassFromTestFixture'
                        'functions\Remove-TestSession'
                        'functions\Start-TestSession'
                        'PSClasses\FixtureDiscovererBase.ps1'
                        'PSClasses\GpUnitFixtureDiscoverer.ps1'
                        'PSClasses\GpUnitDebugTestRunner.ps1'
                        'PSClasses\GpUnitParellelTestRunner.ps1'
                        'PSClasses\TestCase.ps1'
                        'PSClasses\TestDefinition.ps1'
                        'PSClasses\TestFixture.ps1'
                        'PSClasses\TestInvocationInfo.ps1'
                        'PSClasses\TestRunnerBase.ps1'
                        'PSClasses\TestRunSummary.ps1'
                        'PSClasses\TestSession.ps1'
                        )

          PrivateData = @{
                            PSData = @{
                                Tags = 'gpUnit Gravity GravityPS GravityPS-Unit powershell'
                                LicenseUri = 'http://opensource.org/licenses/MIT'
                                ProjectUri = 'https://github.com/GhostSquad/gpUnit'
                                IconUri = ''
                                ReleaseNotes = ''
                            }
                        }
}
