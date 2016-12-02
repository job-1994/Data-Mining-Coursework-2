param(
	[int]$runs = 30,
	[Parameter(Mandatory=$true)][string]$benchmark,
	[int]$generations = 150,
	[int]$popsize = 100,
	[double]$elitism_dec = 1,
	[int]$tournament = 7,
	[int]$depth = 17
	)

$elitism_dec = $elitism_dec/100
$elitism = [System.Math]::Floor($popsize*$elitism_dec)
Write-host "Elitism::  $elitism"
$output_path = "C:\Users\Job\Documents\Year_4\BIC\Assignments\CW 2\results"

Clear-Content "${output_path}\result.txt"
Clear-Content "${output_path}\result_interim.txt"

For($i = 0; $i -lt $runs; $i++)
{
	if($benchmark -like "Sextic Regression")
	{
		java -cp . ec.Evolve -file cw2/sextic_regression.params -p generations=$generations -p pop.subpop.0.size=$popsize -p breed.elite.0=$elitism -p select.tournament.size=$tournament -p gp.koza.mutate.maxdepth=$depth -p gp.koza.xover.maxdepth=$depth
	}
	elseif($benchmark -like "Santa Fe")
	{
		java -cp . ec.Evolve -file cw2/santa_fe_ant.params -p generations=$generations -p pop.subpop.0.size=$popsize -p breed.elite.0=$elitism -p select.tournament.size=$tournament -p gp.koza.mutate.maxdepth=$depth -p gp.koza.xover.maxdepth=$depth
	}
	else 
	{
		Write-host "Not a valid equation, Santa Fe or Sextic Regression"
		Exit    
	}
	Copy-Item .\out.stat "$output_path/out_${i}.txt"
}
Write-host "Finished GP"

For($i = 0; $i -lt $runs; $i++)
{

$line = Get-Content "${output_path}\out_${i}.txt" | select-string "Best Individual of Run:" -context 0,3 > "C:\Users\Job\Documents\Year_4\BIC\Assignments\CW 2\results\res.txt"

$specific = Get-Content "${output_path}\res.txt" | select-string -Pattern "Fitness"
 Add-Content "C:\Users\Job\Documents\Year_4\BIC\Assignments\CW 2\results\result_interim.txt" "$specific"
}

Write-host "Process Results"

$raw = Get-Content "${output_path}\result_interim.txt"
$Hits_total = $Adjusted_total	= $Standardized_total = 0
$Hits_max 	= $Adjusted_max 	= $Standardized_max = 0
$Hits_min	= $Adjusted_min 	= $Standardized_min = [double]::PositiveInfinity

foreach($index in $raw)
{
	$empty, $empty, $Fit, $Standardized, $Adjusted, $Hits = $index.split(' ',6)

	$title_S, 	$Standardized_value = 	$Standardized.split('=',2)
	$empty, 	$Adjusted_value 	= 	$Adjusted.split('=',2)
	$empty, 	$Hits_value 		= 	$Hits.split('=',2)

	$Hits_total 		= $Hits_total 			+ 	[float]$Hits_value
	$Standardized_total = $Standardized_total 	+ 	[float]$Standardized_value
	$Adjusted_total 	= $Adjusted_total 		+ 	[float]$Adjusted_value

	Write-host " ---------"
	Write-host "Val: $Standardized_value"
	Write-host "Max: $Standardized_max"
	Write-host "Min: $Standardized_min"
	Write-host " ---------"	
	
	if($Standardized_value -le $Standardized_min)
	{
		$Standardized_min = $Standardized_value
	}
	if($Standardized_value -ge $Standardized_max)
	{
		$Standardized_max = $Standardized_value
	}
	if($Hits_value -le $Hits_min)
	{
		$Hits_min = $Hits_value
	}
	if($Hits_value -ge $Hits_max)
	{
		$Hits_max = $Hits_value
	}
	
	if($Adjusted_value -le $Adjusted_min)
	{
		$Adjusted_min = $Adjusted_value
	}
	if($Adjusted_value -ge $Adjusted_max)
	{
		$Adjusted_max = $Adjusted_value
	}

}

$Standardized_mean 	= 	$Standardized_total/$runs
$Adjusted_mean 		=	$Adjusted_total/$runs
$Hits_mean 			= 	$Hits_total/$runs

$Standardized_deviation_total = $Adjusted_deviation_total = $Hits_deviation_total = 0

foreach($index in $raw)
{
	$empty, $empty, $Fit, $Standardized, $Adjusted, $Hits = $index.split(' ',6)

	$title_S, 	$Standardized_value = 	$Standardized.split('=',2)
	$empty, 	$Adjusted_value 	= 	$Adjusted.split('=',2)
	$empty, 	$Hits_value 		= 	$Hits.split('=',2)
	$Standardized_deviation_total = $Standardized_deviation_total + [math]::pow($Standardized_value - $Standardized_mean,2)
	$Adjusted_deviation_total = $Adjusted_deviation_total + [math]::pow($Adjusted_value - $Adjusted_mean,2)
	$Hits_deviation_total = $Hits_deviation_total + [math]::pow($Hits_value - $Hits_mean,2)

}

$Standardized_standard_deviation = [math]::Sqrt($Standardized_deviation_total/$runs)
$Adjusted_standard_deviation = [math]::Sqrt($Adjusted_deviation_total/$runs)
$Hits_standard_deviation = [math]::Sqrt($Hits_deviation_total/$runs)


 Add-Content "C:\Users\Job\Documents\Year_4\BIC\Assignments\CW 2\results\result.txt" "$Standardized_mean"
 Add-Content "C:\Users\Job\Documents\Year_4\BIC\Assignments\CW 2\results\result.txt" "$Standardized_max"
 Add-Content "C:\Users\Job\Documents\Year_4\BIC\Assignments\CW 2\results\result.txt" "$Standardized_min"
 Add-Content "C:\Users\Job\Documents\Year_4\BIC\Assignments\CW 2\results\result.txt" "$Standardized_standard_deviation"

 Add-Content "C:\Users\Job\Documents\Year_4\BIC\Assignments\CW 2\results\result.txt" "$Adjusted_mean"
 Add-Content "C:\Users\Job\Documents\Year_4\BIC\Assignments\CW 2\results\result.txt" "$Adjusted_max"
 Add-Content "C:\Users\Job\Documents\Year_4\BIC\Assignments\CW 2\results\result.txt" "$Adjusted_min"
 Add-Content "C:\Users\Job\Documents\Year_4\BIC\Assignments\CW 2\results\result.txt" "$Adjusted_standard_deviation"

 Add-Content "C:\Users\Job\Documents\Year_4\BIC\Assignments\CW 2\results\result.txt" "$Hits_mean"
 Add-Content "C:\Users\Job\Documents\Year_4\BIC\Assignments\CW 2\results\result.txt" "$Hits_max"
 Add-Content "C:\Users\Job\Documents\Year_4\BIC\Assignments\CW 2\results\result.txt" "$Hits_min"
 Add-Content "C:\Users\Job\Documents\Year_4\BIC\Assignments\CW 2\results\result.txt" "$Hits_standard_deviation"

Write-host "-----------------------------"
Write-host "Parameters"
Write-host "-----------------------------"
Write-host "runs:			|	$runs"
Write-host "benchmark:		|	$benchmark"
Write-host "generations:		|	$generations"
Write-host "popsize			|	$popsize"
Write-host "elitism			|	$elitism_dec"
Write-host "tournament		|	$tournament"
Write-host "depth			|	$depth"
Write-host "*****************************"


Write-host "-----------------------------"
Write-host "STANDARDIZED"
Write-host "-----------------------------"
Write-host "Mean:		|	$Standardized_mean"
Write-host "Max:		|	$Standardized_max"
Write-host "Min:		|	$Standardized_min"
Write-host "std. dev.	|	$Standardized_standard_deviation"
Write-host "*****************************"

Write-host "-----------------------------"
Write-host "ADJUSTED"
Write-host "-----------------------------"
Write-host "Mean 		|	$Adjusted_mean"
Write-host "Max: 		|	$Adjusted_max"
Write-host "Min: 		|	$Adjusted_min"
Write-host "std. dev.	|	$Adjusted_standard_deviation"
Write-host "*****************************"

Write-host "-----------------------------"
Write-host "HITS"
Write-host "-----------------------------"
Write-host "Mean		| 	$Hits_mean"
Write-host "Max: 		|	$Hits_max"
Write-host "Min: 		|	$Hits_min"
Write-host "std. dev.	|	$Hits_standard_deviation"
Write-host "*****************************"

[console]::beep(500,100)
[console]::beep(750,750)

Write-host "Done"

