param(
	[string]$algorithm = "J48"
	)

$training_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Original Data\arff\opttraining.arff"
$test_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Original Data\arff\opttesting.arff"
$output_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Results\Decision Trees\"
$folds = 10
$min_instance_per_leaf = 2
$pruning_confidence = 0.25

if($algorithm -NotMatch "J48" -And $algorithm -NotMatch "J48Consolidated" -And $algorithm -NotMatch "J48graft")
{
	Write-host "Type in J48, J48graft or J48Consolidated"
	break
}

# java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run $algorithm -t $training_dir -T $test_dir -x $folds -M $min_instance_per_leaf -C $pruning_confidence > ${output_dir}${algorithm}"\test.txt"

#******************************************************************************************************************************************************************
#cross validate original training_dir

for($i = 0; $i -lt 3; $i++)
{
	Write-host "$i"
	if($i -eq 0)
	{
		Write-host "Cross Validate original"
		$training_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Original Data\arff\opttraining.arff"
		$output_folder = "\cross-validate"
	}
	elseif($i -eq 1)
	{
		Write-host "Cross Validate 1000"
		$training_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\New Data\train-1000\opttraining.arff"
		$output_folder = "\cross-validate 1000"
	}
	elseif($i -eq 2)
	{
		Write-host "Cross Validate 2000"
		$training_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\New Data\train-2000\opttraining.arff"
		$output_folder = "\cross-validate 2000"
	}
	Write-host "Training Directory: $training_dir"
	Write-host "Testing Directory: $test_dir"
	Write-host "default"
	java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run $algorithm -t $training_dir -x $folds  > ${output_dir}${algorithm}${output_folder}"\default.txt"
	Write-host "unpruned"
	java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run $algorithm -t $training_dir -x $folds -U > ${output_dir}${algorithm}${output_folder}"\unpruned.txt"	
	Write-host "binary_splits"
	java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run $algorithm -t $training_dir -x $folds -B > ${output_dir}${algorithm}${output_folder}"\binary_splits.txt"		

	#test prune range 0.05 - 0.65, increment by 0.05
	$pruning_confidence = 0.05
	$instance_per_leaf = 2

	for($j = 0; $j -lt 7; $j++)
	{
		Write-host "pruning_confidence : $pruning_confidence"
		java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run $algorithm -t $training_dir -x $folds -C $pruning_confidence > ${output_dir}${algorithm}${output_folder}"\pruning_confidence_"$pruning_confidence".txt"		
		$pruning_confidence = $pruning_confidence + 0.05;
	}
		$instance_per_leaf = 1
	for($j = 0; $j -lt 11; $j++)
	{
		Write-host "instance_per_leaf : $instance_per_leaf"
		java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run $algorithm -t $training_dir -x $folds -M $instance_per_leaf > ${output_dir}${algorithm}${output_folder}"\instance_per_leaf_"$instance_per_leaf".txt"		
		$instance_per_leaf = $instance_per_leaf*2;
	}
	Write-host "Finished $i"
}



for($i = 0; $i -lt 3; $i++)
{
	Write-host "$i"
	if($i -eq 0)
	{
		Write-host "Test original"
		$training_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Original Data\arff\opttraining.arff"
		$test_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Original Data\arff\opttesting.arff"
		$output_folder = "\test-original"
	}
	elseif($i -eq 1)
	{
		Write-host "Test 1000"
		$training_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\New Data\train-1000\opttraining.arff"
		$test_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\New Data\train-1000\opttesting.arff"
		$output_folder = "\train-1000"
	}
	elseif($i -eq 2)
	{
		Write-host "Test 2000"
		$training_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\New Data\train-2000\opttraining.arff"
		$test_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\New Data\train-2000\opttesting.arff"		
		$output_folder = "\train-2000"
	}
	Write-host "Training Directory: $training_dir"
	Write-host "Testing Directory: $test_dir"
	Write-host "default"
	java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run $algorithm -t $training_dir -T $test_dir  > ${output_dir}${algorithm}${output_folder}"\default.txt"
	Write-host "unpruned"
	java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run $algorithm -t $training_dir -T $test_dir -U > ${output_dir}${algorithm}${output_folder}"\unpruned.txt"	
	Write-host "binary_splits"
	java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run $algorithm -t $training_dir -T $test_dir -B > ${output_dir}${algorithm}${output_folder}"\binary_splits.txt"		

	#test prune range 0.05 - 0.65, increment by 0.05
	$pruning_confidence = 0.05
	$instance_per_leaf = 2

	for($j = 0; $j -lt 7; $j++)
	{
		Write-host "pruning_confidence : $pruning_confidence"
		java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run $algorithm -t $training_dir -T $test_dir -C $pruning_confidence > ${output_dir}${algorithm}${output_folder}"\pruning_confidence_"$pruning_confidence".txt"		
		$pruning_confidence = $pruning_confidence + 0.05;
	}
		$instance_per_leaf = 1
	for($j = 0; $j -lt 11; $j++)
	{
		Write-host "instance_per_leaf : $instance_per_leaf"
		java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run $algorithm -t $training_dir -T $test_dir -M $instance_per_leaf > ${output_dir}${algorithm}${output_folder}"\instance_per_leaf_"$instance_per_leaf".txt"		
		$instance_per_leaf = $instance_per_leaf*2;
	}
	Write-host "Finished $i"

}

