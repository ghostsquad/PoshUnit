$ErrorActionPreference = "Stop"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$modulePath = Join-Path $here "PoshUnit.psm1"

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

$myTestFixture = New-TestFixture {
	
	$foo = "hello world"

	$setup = New-TestSetup {
		Write-Host "Setup" -ForegroundColor Cyan
	}
	
	$teardown = New-TestTeardown {
		Write-Host "Teardown" -ForegroundColor Yellow
	}
	
	$testFail = New-Test {
		throw "omg! wtf happened?"
	}
	
	$test1 = New-Test {
		Write-Host "Test1!" -ForegroundColor Green
	}
	
	$testFoo = New-Test {
		Write-Host "value of foo: $foo" -ForegroundColor Green
	}
}

function GetPrivateMethodsDictionary {
	$privateMethodsDictionary = New-Object 'system.collections.generic.dictionary[[string],[ScriptBlock]]'
	$privateMethods = @([scriptblock]::Create($testFixtures[0].Value.ToString() + '; gci function:\').Invoke())
	$privateMethods | %{
		$privateMethodsDictionary.Add($_.Name, $_.ScriptBlock)
	}
	
	return $privateMethodsDictionary
}

$testFixtures = gci variable:\ | ?{$_.Value.IsPoshUnitTestFixture} 
$testFixtures.Count
$testFixtures[0].Name
$setup = [scriptblock]::Create($testFixtures[0].Value.ToString() + '; gci variable:\ | ?{$_.Value.IsPoshUnitTestSetup} | %{$_.Value.Invoke()}')
$teardown = [scriptblock]::Create($testFixtures[0].Value.ToString() + '; gci variable:\ | ?{$_.Value.IsPoshUnitTestTeardown} | %{$_.Value.Invoke()}')
$tests = @([scriptblock]::Create($testFixtures[0].Value.ToString() + '; gci variable:\ | ?{$_.Value.IsPoshUnitTest} | %{$_.Value}').Invoke())

$privateVariables = @([scriptblock]::Create($testFixtures[0].Value.ToString() + '; gci variable:\ | ?{-not $_.Value.IsPoshUnitTest -and -not $_.Value.IsPoshUnitTestTeardown -and -not $_.Value.IsPoshUnitTestSetup}').Invoke())
$privateMethodsDictionary = GetPrivateMethodsDictionary

function runTests {
	$testData = New-Object -TypeName PSObject -Property @{
		Passed = 0
		Failed = 0
	}

	foreach($test in $tests) {	
		$testScriptBlockString = "Import-Module '$modulePath'"
		$testScriptBlockString += $testFixtures[0].Value.ToString()
		$testScriptBlockString += $test.ToString()
		$testScriptBlock = [scriptblock]::Create($testScriptBlockString)
		Try {
			Invoke-Command -ScriptBlock $testScriptBlock
			$testData.Passed++
		}
		Catch [Exception] {
			$testData.Failed++
		}
		#$null = Start-Job -ScriptBlock $testScriptBlock -InitializationScript $([scriptblock]::Create())
	}
	
	Write-Output $testData
}

runTests | ft -AutoSize