function New-Test {
	param(
		[scriptblock]$testDefinition = $(throw "-testDefinition parameter required!")
	)
	$testDefinition.Attributes.Add((new-object [PoshUnit.PoshUnitTestAttribute()]))
	Write-Output $testDefinition
}