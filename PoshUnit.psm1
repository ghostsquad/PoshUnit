$here = Split-Path -Parent $MyInvocation.MyCommand.Path

Add-Type -AssemblyName 'System.IO.Compression.Filesystem'
Add-Type -Path (Join-Path $here "xunit.dll")

function New-Test {
	param(
		[scriptblock]$testDefinition = $(throw "-testDefinition parameter required!")
	)
	$testDefinition | Add-Member -MemberType NoteProperty -Name IsPoshUnitTest -Value $true
	Write-Output $testDefinition
}

function New-TestFixture {
	param(
		[scriptblock]$fixtureDefinition = $(throw "-fixtureDefinition parameter required!")
	)
	$fixtureDefinition | Add-Member -MemberType NoteProperty -Name IsPoshUnitTestFixture -Value $true
	Write-Output $fixtureDefinition
}

function New-TestSetup {
	param(
		[scriptblock]$setupDefinition = $(throw "-setupDefinition parameter required!")
	)
	$setupDefinition | Add-Member -MemberType NoteProperty -Name IsPoshUnitTestSetup -Value $true
	Write-Output $setupDefinition
}

function New-TestTeardown {
	param(
		[scriptblock]$teardownDefinition = $(throw "-teardownDefinition parameter required!")
	)
	$teardownDefinition | Add-Member -MemberType NoteProperty -Name IsPoshUnitTestTeardown -Value $true
	Write-Output $teardownDefinition
}

. $here\Invoke-PoshUnit.ps1

Export-ModuleMember -Function *-*