param(
	[string]$class = "Decision Trees"
	)
if($class -match "Decision Trees")
{
	$txt_files = "default","binary_splits","unpruned","pruning_confidence_0.05", "pruning_confidence_0.1", "pruning_confidence_0.15","pruning_confidence_0.2","pruning_confidence_0.25","pruning_confidence_0.3","pruning_confidence_0.35", "instance_per_leaf_1", "instance_per_leaf_2", "instance_per_leaf_4", "instance_per_leaf_8", "instance_per_leaf_16", "instance_per_leaf_32", "instance_per_leaf_64", "instance_per_leaf_128", "instance_per_leaf_256", "instance_per_leaf_512", "instance_per_leaf_1024"
	$algorithm_folders = "J48", "J48Consolidated"
	$input_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Results\Decision Trees"
	$output_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Results\Decision Trees\interim"
}
elseif($class -match "Neural Network")
{
# 	$txt_files = 'default',"generations_100", "generations_300", "generations_500", "generations_700", "generations_900", "generations_1100", "generations_1300", "generations_1500", "generations_1700", "generations_1900", "layers_and_nodes_a", "layers_and_nodes_i", "layers_and_nodes_o", "layers_and_nodes_t", "learning_rate_0.1", "learning_rate_0.2", "learning_rate_0.3", "learning_rate_0.4", "learning_rate_0.5", "learning_rate_0.6", "learning_rate_0.7", "learning_rate_0.8", "momentum_0.1", "momentum_0.2", "momentum_0.3", "momentum_0.4", "momentum_0.5", "momentum_0.6", "momentum_0.7", "momentum_0.8","momentum_0.9","momentum_1", "validation_threshold_10", "validation_threshold_20", "validation_threshold_30", "validation_threshold_40", "validation_threshold_50", "validation_threshold_60", "validation_threshold_70", "validation_threshold_80","layers_and_nodes_2", "layers_and_nodes_3", "layers_and_nodes_4", "layers_and_nodes_5","layers_and_nodes_2,2", "layers_and_nodes_3,3", "layers_and_nodes_4,4", "layers_and_nodes_5,5","layers_and_nodes_2,2,2", "layers_and_nodes_3,3,3", "layers_and_nodes_4,4,4", "layers_and_nodes_5,5,5","layers_and_nodes_2,2,2,2", "layers_and_nodes_3,3,3,3", "layers_and_nodes_4,4,4,4", "layers_and_nodes_5,5,5,5","layers_and_nodes_2,2,2,2,2", "layers_and_nodes_3,3,3,3,3", "layers_and_nodes_4,4,4,4,4", "layers_and_nodes_5,5,5,5,5"
	$txt_files = "layers_and_nodes_2", "layers_and_nodes_3", "layers_and_nodes_4", "layers_and_nodes_5","layers_and_nodes_2,2", "layers_and_nodes_3,3", "layers_and_nodes_4,4", "layers_and_nodes_5,5","layers_and_nodes_2,2,2", "layers_and_nodes_3,3,3", "layers_and_nodes_4,4,4", "layers_and_nodes_5,5,5","layers_and_nodes_2,2,2,2", "layers_and_nodes_3,3,3,3", "layers_and_nodes_4,4,4,4", "layers_and_nodes_5,5,5,5","layers_and_nodes_2,2,2,2,2", "layers_and_nodes_3,3,3,3,3", "layers_and_nodes_4,4,4,4,4", "layers_and_nodes_5,5,5,5,5"
	$algorithm_folders = "Neural Network", "Neural Network"
	$input_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Results\Neural Network"
	$output_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Results\Neural Network\interim"
}



#------------------------------------------------------------------------------------------------------------------------------------------------------
# CROSS-VALIDATION
#------------------------------------------------------------------------------------------------------------------------------------------------------
$sub_folders_cross = "cross-validate","cross-validate 1000", "cross-validate 2000"
for($j = 0; $j -lt $algorithm_folders.length; $j++)
{
  for($f = 0; $f -lt $sub_folders_cross.length; $f++)
  {  
	
	$correctly_classified_training_array = New-Object System.Collections.ArrayList
	$TP_rate_training_array = New-Object System.Collections.ArrayList
	$FP_Rate_training_array = New-Object System.Collections.ArrayList
	$Precision_training_array = New-Object System.Collections.ArrayList
	$Recall_training_array = New-Object System.Collections.ArrayList
	$F_Measure_training_array = New-Object System.Collections.ArrayList
	$ROC_Area_training_array = New-Object System.Collections.ArrayList

	$correctly_classified_test_array = New-Object System.Collections.ArrayList
	$TP_rate_test_array = New-Object System.Collections.ArrayList
	$FP_Rate_test_array = New-Object System.Collections.ArrayList
	$Precision_test_array = New-Object System.Collections.ArrayList
	$Recall_test_array = New-Object System.Collections.ArrayList
	$F_Measure_test_array = New-Object System.Collections.ArrayList
	$ROC_Area_test_array = New-Object System.Collections.ArrayList

	for($l = 0; $l -lt $txt_files.length; $l++)
	{
		$alg = $algorithm_folders[$j]
		$fold = $sub_folders_cross[$f]
		$file = $txt_files[$l]
		Write-host ${input_dir}"\"$alg"\"$fold"\"$file".txt"
		Get-Content ${input_dir}"\"$alg"\"$fold"\"$file".txt" | select-string "Error on training Data " -context 0,26 > $output_dir"\interim.txt"
		$instances = Get-Content $output_dir"\interim.txt" | select -first 1 -skip 3

		$info = Get-Content $output_dir"\interim.txt" | select -first 1 -skip 26

		[string[]]$classification = $instances.Split(' ',[System.StringSplitOptions]::RemoveEmptyEntries)
		[string[]]$extra_info = $info.Split(' ',[System.StringSplitOptions]::RemoveEmptyEntries)
		Write-host "------------------------------------------------------"
		Write-host $alg
		Write-host $fold
		Write-host $file
		Write-host $classification
		Write-host $extra_info
		Write-host "------------------------------------------------------"
		$correctly_classified = $classification[4]
		$TP_rate = $extra_info[2]
		$FP_Rate = $extra_info[3]
		$Precision = $extra_info[4]
		$Recall = $extra_info[5]
		$F_Measure = $extra_info[6]
		$ROC_Area = $extra_info[8]

		$correctly_classified_training_array.Add($correctly_classified)
		$TP_rate_training_array.Add($TP_rate)
		$FP_Rate_training_array.Add($FP_Rate)
		$Precision_training_array.Add($Precision)
		$Recall_training_array.Add($Recall)
		$F_Measure_training_array.Add($F_Measure)
		$ROC_Area_training_array.Add($ROC_Area)

		Clear-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt"

		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$correctly_classified"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$TP_rate"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$FP_Rate"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$Precision"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$Recall"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$F_Measure"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$ROC_Area"
	}

	for($l = 0; $l -lt $txt_files.length; $l++)
	{
		$alg = $algorithm_folders[$j]
		$fold = $sub_folders_cross[$f]
		$file = $txt_files[$l]
		Get-Content ${input_dir}"\"$alg"\"$fold"\"$file".txt" | select-string "Stratified " -context 0,26 > $output_dir"\interim.txt"
		$instances = Get-Content $output_dir"\interim.txt" | select -first 1 -skip 3

		$info = Get-Content $output_dir"\interim.txt" | select -first 1 -skip 26

		[string[]]$classification = $instances.Split(' ',[System.StringSplitOptions]::RemoveEmptyEntries)
		[string[]]$extra_info = $info.Split(' ',[System.StringSplitOptions]::RemoveEmptyEntries)
		Write-host "------------------------------------------------------"
		Write-host $alg
		Write-host $fold
		Write-host $file
		Write-host $classification
		Write-host $extra_info
		Write-host "------------------------------------------------------"
		$correctly_classified = $classification[4]
		$TP_rate = $extra_info[2]
		$FP_Rate = $extra_info[3]
		$Precision = $extra_info[4]
		$Recall = $extra_info[5]
		$F_Measure = $extra_info[6]
		$ROC_Area = $extra_info[8]

		$correctly_classified_test_array.Add($correctly_classified)
		$TP_rate_test_array.Add($TP_rate)
		$FP_Rate_test_array.Add($FP_Rate)
		$Precision_test_array.Add($Precision)
		$Recall_test_array.Add($Recall)
		$F_Measure_test_array.Add($F_Measure)
		$ROC_Area_test_array.Add($ROC_Area)

		Clear-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt"

		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$correctly_classified"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$TP_rate"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$FP_Rate"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$Precision"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$Recall"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$F_Measure"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$ROC_Area"
	}

	Clear-Content $output_dir"\"$alg"\${fold}_excel.txt"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "training"	
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$correctly_classified_training_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$TP_rate_training_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$FP_Rate_training_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$Precision_training_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$Recall_training_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$F_Measure_training_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$ROC_Area_training_array"

	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "test"	
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$correctly_classified_test_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$TP_rate_test_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$FP_Rate_test_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$Precision_test_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$Recall_test_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$F_Measure_test_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$ROC_Area_test_array"
  }

}

#------------------------------------------------------------------------------------------------------------------------------------------------------
# Testing
#------------------------------------------------------------------------------------------------------------------------------------------------------

$sub_folders_test =  "test-original", "train-1000", "train-2000"
for($j = 0; $j -lt $algorithm_folders.length; $j++)
{
  for($f = 0; $f -lt $sub_folders_test.length; $f++)
  {  
		
	$correctly_classified_training_array = New-Object System.Collections.ArrayList
	$TP_rate_training_array = New-Object System.Collections.ArrayList
	$FP_Rate_training_array = New-Object System.Collections.ArrayList
	$Precision_training_array = New-Object System.Collections.ArrayList
	$Recall_training_array = New-Object System.Collections.ArrayList
	$F_Measure_training_array = New-Object System.Collections.ArrayList
	$ROC_Area_training_array = New-Object System.Collections.ArrayList

	$correctly_classified_test_array = New-Object System.Collections.ArrayList
	$TP_rate_test_array = New-Object System.Collections.ArrayList
	$FP_Rate_test_array = New-Object System.Collections.ArrayList
	$Precision_test_array = New-Object System.Collections.ArrayList
	$Recall_test_array = New-Object System.Collections.ArrayList
	$F_Measure_test_array = New-Object System.Collections.ArrayList
	$ROC_Area_test_array = New-Object System.Collections.ArrayList


	for($l = 0; $l -lt $txt_files.length; $l++)
	{
		$alg = $algorithm_folders[$j]
		$fold = $sub_folders_test[$f]
		$file = $txt_files[$l]
		Get-Content ${input_dir}"\"$alg"\"$fold"\"$file".txt" | select-string " Error on training data " -context 0,26 > $output_dir"\interim.txt"
		$instances = Get-Content $output_dir"\interim.txt" | select -first 1 -skip 3

		$info = Get-Content $output_dir"\interim.txt" | select -first 1 -skip 26

		[string[]]$classification = $instances.Split(' ',[System.StringSplitOptions]::RemoveEmptyEntries)
		[string[]]$extra_info = $info.Split(' ',[System.StringSplitOptions]::RemoveEmptyEntries)
		Write-host "------------------------------------------------------"
		Write-host $alg
		Write-host $fold
		Write-host $file
		Write-host $classification
		Write-host $extra_info
		Write-host "------------------------------------------------------"
		$correctly_classified = $classification[4]
		$TP_rate = $extra_info[2]
		$FP_Rate = $extra_info[3]
		$Precision = $extra_info[4]
		$Recall = $extra_info[5]
		$F_Measure = $extra_info[6]
		$ROC_Area = $extra_info[8]

		$correctly_classified_training_array.Add($correctly_classified)
		$TP_rate_training_array.Add($TP_rate)
		$FP_Rate_training_array.Add($FP_Rate)
		$Precision_training_array.Add($Precision)
		$Recall_training_array.Add($Recall)
		$F_Measure_training_array.Add($F_Measure)
		$ROC_Area_training_array.Add($ROC_Area)
		
		Clear-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt"

		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$correctly_classified"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$TP_rate"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$FP_Rate"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$Precision"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$Recall"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$F_Measure"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$ROC_Area"
	}


	for($l = 0; $l -lt $txt_files.length; $l++)
	{
		$alg = $algorithm_folders[$j]
		$fold = $sub_folders_test[$f]
		$file = $txt_files[$l]
		Get-Content ${input_dir}"\"$alg"\"$fold"\"$file".txt" | select-string "Error on test data " -context 0,26 > $output_dir"\interim.txt"
		$instances = Get-Content $output_dir"\interim.txt" | select -first 1 -skip 3

		$info = Get-Content $output_dir"\interim.txt" | select -first 1 -skip 26

		[string[]]$classification = $instances.Split(' ',[System.StringSplitOptions]::RemoveEmptyEntries)
		[string[]]$extra_info = $info.Split(' ',[System.StringSplitOptions]::RemoveEmptyEntries)
		Write-host "------------------------------------------------------"
		Write-host $alg
		Write-host $fold
		Write-host $file
		Write-host $classification
		Write-host $extra_info
		Write-host "------------------------------------------------------"
		$correctly_classified = $classification[4]
		$TP_rate = $extra_info[2]
		$FP_Rate = $extra_info[3]
		$Precision = $extra_info[4]
		$Recall = $extra_info[5]
		$F_Measure = $extra_info[6]
		$ROC_Area = $extra_info[8]

		$correctly_classified_test_array.Add($correctly_classified)
		$TP_rate_test_array.Add($TP_rate)
		$FP_Rate_test_array.Add($FP_Rate)
		$Precision_test_array.Add($Precision)
		$Recall_test_array.Add($Recall)
		$F_Measure_test_array.Add($F_Measure)
		$ROC_Area_test_array.Add($ROC_Area)

		Clear-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt"

		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$correctly_classified"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$TP_rate"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$FP_Rate"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$Precision"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$Recall"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$F_Measure"
		Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$ROC_Area"
	}

	Clear-Content $output_dir"\"$alg"\${fold}_excel.txt"

	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "training"	
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$correctly_classified_training_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$TP_rate_training_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$FP_Rate_training_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$Precision_training_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$Recall_training_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$F_Measure_training_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$ROC_Area_training_array"

	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "test"	
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$correctly_classified_test_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$TP_rate_test_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$FP_Rate_test_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$Precision_test_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$Recall_test_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$F_Measure_test_array"
	Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$ROC_Area_test_array"
  }

}


# $txt_files = "default","binary_splits","unpruned","pruning_confidence_0.05", "pruning_confidence_0.1", "pruning_confidence_0.15","pruning_confidence_0.2","pruning_confidence_0.25","pruning_confidence_0.3","pruning_confidence_0.35", "instance_per_leaf_1", "instance_per_leaf_2", "instance_per_leaf_4", "instance_per_leaf_8", "instance_per_leaf_16", "instance_per_leaf_32", "instance_per_leaf_64", "instance_per_leaf_128", "instance_per_leaf_256", "instance_per_leaf_512", "instance_per_leaf_1024"

# $algorithm_folders = "J48", "J48Consolidated" #, "J48graft"


# $input_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Results\Decision Trees"
# $output_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Results\Decision Trees\interim"

# $sub_folders_test =  "test-original", "train-1000", "train-2000"
# $sub_folders_cross = "cross-validate","cross-validate 1000", "cross-validate 2000"


# $j = 0
# $f = 2


# $correctly_classified_training_array = New-Object System.Collections.ArrayList
# $TP_rate_training_array = New-Object System.Collections.ArrayList
# $FP_Rate_training_array = New-Object System.Collections.ArrayList
# $Precision_training_array = New-Object System.Collections.ArrayList
# $Recall_training_array = New-Object System.Collections.ArrayList
# $F_Measure_training_array = New-Object System.Collections.ArrayList
# $ROC_Area_training_array = New-Object System.Collections.ArrayList

# $correctly_classified_test_array = New-Object System.Collections.ArrayList
# $TP_rate_test_array = New-Object System.Collections.ArrayList
# $FP_Rate_test_array = New-Object System.Collections.ArrayList
# $Precision_test_array = New-Object System.Collections.ArrayList
# $Recall_test_array = New-Object System.Collections.ArrayList
# $F_Measure_test_array = New-Object System.Collections.ArrayList
# $ROC_Area_test_array = New-Object System.Collections.ArrayList


# for($l = 0; $l -lt $txt_files.length; $l++)
# {
# 	$alg = $algorithm_folders[$j]
# 	$fold = $sub_folders_test[$f]
# 	$file = $txt_files[$l]
# 	Get-Content ${input_dir}"\"$alg"\"$fold"\"$file".txt" | select-string "Error on training data " -context 0,26 > $output_dir"\interim.txt"
# 	$instances = Get-Content $output_dir"\interim.txt" | select -first 1 -skip 3

# 	$info = Get-Content $output_dir"\interim.txt" | select -first 1 -skip 26

# 	[string[]]$classification = $instances.Split(' ',[System.StringSplitOptions]::RemoveEmptyEntries)
# 	[string[]]$extra_info = $info.Split(' ',[System.StringSplitOptions]::RemoveEmptyEntries)
# 	Write-host "------------------------------------------------------"
# 	Write-host $alg
# 	Write-host $fold
# 	Write-host $file
# 	Write-host $classification
# 	Write-host $extra_info
# 	Write-host "------------------------------------------------------"
# 	$correctly_classified = $classification[4]
# 	$TP_rate = $extra_info[2]
# 	$FP_Rate = $extra_info[3]
# 	$Precision = $extra_info[4]
# 	$Recall = $extra_info[5]
# 	$F_Measure = $extra_info[6]
# 	$ROC_Area = $extra_info[8]

# 	$correctly_classified_training_array.Add($correctly_classified)
# 	$TP_rate_training_array.Add($TP_rate)
# 	$FP_Rate_training_array.Add($FP_Rate)
# 	$Precision_training_array.Add($Precision)
# 	$Recall_training_array.Add($Recall)
# 	$F_Measure_training_array.Add($F_Measure)
# 	$ROC_Area_training_array.Add($ROC_Area)
	

# 	# Write-host "correctly_classified: $correctly_classified"
# 	# Write-host "TP_rate: $TP_rate"
# 	# Write-host "FP_Rate: $FP_Rate"
# 	# Write-host "Precision: $Precision"
# 	# Write-host "Recall: $Recall"
# 	# Write-host "F_Measure: $F_Measure"
# 	# Write-host "ROC_Area: $ROC_Area"

# 	Clear-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt"

# 	Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$correctly_classified"
# 	Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$TP_rate"
# 	Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$FP_Rate"
# 	Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$Precision"
# 	Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$Recall"
# 	Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$F_Measure"
# 	Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$ROC_Area"
# }


# for($l = 0; $l -lt $txt_files.length; $l++)
# {
# 	$alg = $algorithm_folders[$j]
# 	$fold = $sub_folders_test[$f]
# 	$file = $txt_files[$l]
# 	Get-Content ${input_dir}"\"$alg"\"$fold"\"$file".txt" | select-string "Error on test data " -context 0,26 > $output_dir"\interim.txt"
# 	$instances = Get-Content $output_dir"\interim.txt" | select -first 1 -skip 3

# 	$info = Get-Content $output_dir"\interim.txt" | select -first 1 -skip 26

# 	[string[]]$classification = $instances.Split(' ',[System.StringSplitOptions]::RemoveEmptyEntries)
# 	[string[]]$extra_info = $info.Split(' ',[System.StringSplitOptions]::RemoveEmptyEntries)
# 	Write-host "------------------------------------------------------"
# 	Write-host $alg
# 	Write-host $fold
# 	Write-host $file
# 	Write-host $classification
# 	Write-host $extra_info
# 	Write-host "------------------------------------------------------"
# 	$correctly_classified = $classification[4]
# 	$TP_rate = $extra_info[2]
# 	$FP_Rate = $extra_info[3]
# 	$Precision = $extra_info[4]
# 	$Recall = $extra_info[5]
# 	$F_Measure = $extra_info[6]
# 	$ROC_Area = $extra_info[8]

# 	$correctly_classified_test_array.Add($correctly_classified)
# 	$TP_rate_test_array.Add($TP_rate)
# 	$FP_Rate_test_array.Add($FP_Rate)
# 	$Precision_test_array.Add($Precision)
# 	$Recall_test_array.Add($Recall)
# 	$F_Measure_test_array.Add($F_Measure)
# 	$ROC_Area_test_array.Add($ROC_Area)
	

# 	# Write-host "correctly_classified: $correctly_classified"
# 	# Write-host "TP_rate: $TP_rate"
# 	# Write-host "FP_Rate: $FP_Rate"
# 	# Write-host "Precision: $Precision"
# 	# Write-host "Recall: $Recall"
# 	# Write-host "F_Measure: $F_Measure"
# 	# Write-host "ROC_Area: $ROC_Area"

# 	Clear-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt"

# 	Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$correctly_classified"
# 	Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$TP_rate"
# 	Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$FP_Rate"
# 	Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$Precision"
# 	Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$Recall"
# 	Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$F_Measure"
# 	Add-Content $output_dir"\"$alg"\"$fold"\"$file"_excel.txt" "$ROC_Area"
# }

# Clear-Content $output_dir"\"$alg"\${fold}_excel.txt"

# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "training"	
# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$correctly_classified_training_array"
# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$TP_rate_training_array"
# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$FP_Rate_training_array"
# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$Precision_training_array"
# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$Recall_training_array"
# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$F_Measure_training_array"
# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$ROC_Area_training_array"

# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "test"	
# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$correctly_classified_test_array"
# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$TP_rate_test_array"
# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$FP_Rate_test_array"
# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$Precision_test_array"
# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$Recall_test_array"
# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$F_Measure_test_array"
# Add-Content $output_dir"\"$alg"\${fold}_excel.txt" "$ROC_Area_test_array"

