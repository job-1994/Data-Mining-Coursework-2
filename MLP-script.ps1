param(
	[int]$j = 0
	)

$output_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Results\Neural Network\\Neural Network"


$algorithm = "MultilayerPerceptron"

$training_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Original Data\arff\opttraining.arff"
$output_folder = "cross-validate\"	

# for($j = 0; $j -lt 3; $j++)
# {
	Write-host "$j"
	if($j -eq 0)
	{
		Write-host "cross-validate"
		$training_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Original Data\arff\opttraining.arff"
		$output_folder = "\cross-validate\"
	}
	elseif($j -eq 1)
	{
		Write-host "cross-validate 1000"
		$training_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\New Data\train-1000\opttraining.arff"
		$output_folder = "\cross-validate 1000\"
	}
	elseif($j -eq 2)
	{
		Write-host "cross-validate 2000"
		$training_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\New Data\train-2000\opttraining.arff"
		$output_folder = "\cross-validate 2000\"
	}

# 	$learning_rate = 0.1
# 	for($i = 0; $i -lt 8; $i++)
# 	{	Write-host "Starting $i"
# 		Write-host "Learning Rate : $learning_rate"
# 		java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -L $learning_rate > ${output_dir}${output_folder}"learning_rate_${learning_rate}.txt"
# 		$learning_rate = $learning_rate + 0.1
# 		Write-host "Finished $i"
# 		Write-host ""
# 	}
# [console]::beep(500,100)

	# $momentum = 0.1
	# for($i = 0; $i -lt 8; $i++)
	# $momentum = 0.9
	# for($i = 0; $i -lt 2; $i++)	
	# {	Write-host "Starting $i"
	# 	Write-host "momentum : $momentum"
	# 	java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -M $momentum > ${output_dir}${output_folder}"momentum_${momentum}.txt"
	# 	$momentum = $momentum + 0.1
	# 	Write-host "Finished $i"
	# 	Write-host ""
	# }
# [console]::beep(500,100)
# 	$generations = 900
# 	for($i = 0; $i -lt 10; $i++)
# 	{	Write-host "Starting $i"
# 		Write-host "generations : $generations"
# 		java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -N $generations > ${output_dir}${output_folder}"generations_${generations}.txt"
# 		$generations = $generations + 200
# 		Write-host "Finished $i"
# 		Write-host ""
# 	}
# [console]::beep(500,100)

# 	$validation_threshold = 10
# 	for($i = 0; $i -lt 8; $i++)
# 	{	Write-host "Starting $i"
# 		Write-host "validation_threshold : $validation_threshold"
# 		java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -M $validation_threshold > ${output_dir}${output_folder}"validation_threshold_${validation_threshold}.txt"
# 		$validation_threshold = $validation_threshold + 10
# 		Write-host "Finished $i"
# 		Write-host ""
# 	}


# java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H a > ${output_dir}${output_folder}"layers_and_nodes_a.txt"
# java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H i > ${output_dir}${output_folder}"layers_and_nodes_i.txt"
# java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H o > ${output_dir}${output_folder}"layers_and_nodes_o.txt"
# java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H t > ${output_dir}${output_folder}"layers_and_nodes_t.txt"

java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 2 > ${output_dir}${output_folder}"layers_and_nodes_2.txt"
Write-host "Finished 1 Hidden layer and 2 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 3 > ${output_dir}${output_folder}"layers_and_nodes_3.txt"
Write-host "Finished 1 Hidden layer and 3 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 4 > ${output_dir}${output_folder}"layers_and_nodes_4.txt"
Write-host "Finished 1 Hidden layer and 4 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 5 > ${output_dir}${output_folder}"layers_and_nodes_5.txt"
Write-host "Finished 1 Hidden layer and 5 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 2,2 > ${output_dir}${output_folder}"layers_and_nodes_2,2.txt"
Write-host "Finished 2 Hidden layer and 2 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 3,3 > ${output_dir}${output_folder}"layers_and_nodes_3,3.txt"
Write-host "Finished 2 Hidden layer and 3 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 4,4 > ${output_dir}${output_folder}"layers_and_nodes_4,4.txt"
Write-host "Finished 2 Hidden layer and 4 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 5,5 > ${output_dir}${output_folder}"layers_and_nodes_5,5.txt"
Write-host "Finished 2 Hidden layer and 5 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 2,2,2 > ${output_dir}${output_folder}"layers_and_nodes_2,2,2.txt"
Write-host "Finished 3 Hidden layer and 2 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 3,3,3 > ${output_dir}${output_folder}"layers_and_nodes_3,3,3.txt"
Write-host "Finished 3 Hidden layer and 3 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 4,4,4 > ${output_dir}${output_folder}"layers_and_nodes_4,4,4.txt"
Write-host "Finished 3 Hidden layer and 4 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 5,5,5 > ${output_dir}${output_folder}"layers_and_nodes_5,5,5.txt"
Write-host "Finished 3 Hidden layer and 5 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 2,2,2,2 > ${output_dir}${output_folder}"layers_and_nodes_2,2,2,2.txt"
Write-host "Finished 4 Hidden layer and 2 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 3,3,3,3 > ${output_dir}${output_folder}"layers_and_nodes_3,3,3,3.txt"
Write-host "Finished 4 Hidden layer and 3 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 4,4,4,4 > ${output_dir}${output_folder}"layers_and_nodes_4,4,4,4.txt"
Write-host "Finished 4 Hidden layer and 4 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 5,5,5,5 > ${output_dir}${output_folder}"layers_and_nodes_5,5,5,5.txt"
Write-host "Finished 4 Hidden layer and 5 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 2,2,2,2,2 > ${output_dir}${output_folder}"layers_and_nodes_2,2,2,2,2.txt"
Write-host "Finished 5 Hidden layer and 2 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 3,3,3,3,3 > ${output_dir}${output_folder}"layers_and_nodes_3,3,3,3,3.txt"
Write-host "Finished 5 Hidden layer and 3 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 4,4,4,4,4 > ${output_dir}${output_folder}"layers_and_nodes_4,4,4,4,4.txt"
Write-host "Finished 5 Hidden layer and 4 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -x 10 -H 5,5,5,5,5 > ${output_dir}${output_folder}"layers_and_nodes_5,5,5,5,5.txt"
Write-host "Finished 5 Hidden layer and 5 nodes"

#DEFAULT VALUES
# java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir > ${output_dir}${output_folder}"default.txt"
# Write-host "Finished Cross-Validate"


# }

# for($j = 0; $j -lt 3; $j++)
# {
	Write-host "$j"
	if($j -eq 0)
	{
		Write-host "Test original"
		$training_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Original Data\arff\opttraining.arff"
		$test_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\Original Data\arff\opttesting.arff"
		$output_folder = "\test-original\"
	}
	elseif($j -eq 1)
	{
		Write-host "Test 1000"
		$training_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\New Data\train-1000\opttraining.arff"
		$test_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\New Data\train-1000\opttesting.arff"
		$output_folder = "\train-1000\"
	}
	elseif($j -eq 2)
	{
		Write-host "Test 2000"
		$training_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\New Data\train-2000\opttraining.arff"
		$test_dir = "C:\Users\Job\Documents\Year_4\DMML\Assignments\Coursework 3\New Data\train-2000\opttesting.arff"		
		$output_folder = "\train-2000\"
	}

# 	$learning_rate = 0.1
# 	for($i = 0; $i -lt 8; $i++)
# 	{	Write-host "Starting $i"
# 		Write-host "Learning Rate : $learning_rate"
# 		java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -L $learning_rate > ${output_dir}${output_folder}"learning_rate_${learning_rate}.txt"
# 		$learning_rate = $learning_rate + 0.1
# 		Write-host "Finished $j"
# 		Write-host ""
# 	}
# [console]::beep(500,100)

	# $momentum = 0.1
	# for($i = 0; $i -lt 8; $i++)
	# $momentum = 0.9
	# for($i = 0; $i -lt 2; $i++)
	# {	Write-host "Starting $i"
	# 	Write-host "momentum : $momentum"
	# 	java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -M $momentum > ${output_dir}${output_folder}"momentum_${momentum}.txt"
	# 	$momentum = $momentum + 0.1
	# 	Write-host "Finished $i"
	# 	Write-host ""
	# }
# [console]::beep(500,100)
# 	$generations = 100
# 	for($i = 0; $i -lt 10; $i++)
# 	{	Write-host "Starting $i"
# 		Write-host "generations : $generations"
# 		java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -N $generations > ${output_dir}${output_folder}"generations_${generations}.txt"
# 		$generations = $generations + 200
# 		Write-host "Finished $i"
# 		Write-host ""
# 	}
# [console]::beep(500,100)

# 	$validation_threshold = 10
# 	for($i = 0; $i -lt 8; $i++)
# 	{	Write-host "Starting $i"
# 		Write-host "validation_threshold : $validation_threshold"
# 		java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -M $validation_threshold > ${output_dir}${output_folder}"validation_threshold_${validation_threshold}.txt"
# 		$validation_threshold = $validation_threshold + 10
# 		Write-host "Finished $i"
# 		Write-host ""
# 	}


# java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H a > ${output_dir}${output_folder}"layers_and_nodes_a.txt"
# java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H i > ${output_dir}${output_folder}"layers_and_nodes_i.txt"
# java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H o > ${output_dir}${output_folder}"layers_and_nodes_o.txt"
# java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H t > ${output_dir}${output_folder}"layers_and_nodes_t.txt"


java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 2 > ${output_dir}${output_folder}"layers_and_nodes_2.txt"
Write-host "Finished 1 Hidden layer and 2 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 3 > ${output_dir}${output_folder}"layers_and_nodes_3.txt"
Write-host "Finished 1 Hidden layer and 3 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 4 > ${output_dir}${output_folder}"layers_and_nodes_4.txt"
Write-host "Finished 1 Hidden layer and 4 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 5 > ${output_dir}${output_folder}"layers_and_nodes_5.txt"
Write-host "Finished 1 Hidden layer and 5 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 2,2 > ${output_dir}${output_folder}"layers_and_nodes_2,2.txt"
Write-host "Finished 2 Hidden layer and 2 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 3,3 > ${output_dir}${output_folder}"layers_and_nodes_3,3.txt"
Write-host "Finished 2 Hidden layer and 3 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 4,4 > ${output_dir}${output_folder}"layers_and_nodes_4,4.txt"
Write-host "Finished 2 Hidden layer and 4 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 5,5 > ${output_dir}${output_folder}"layers_and_nodes_5,5.txt"
Write-host "Finished 2 Hidden layer and 5 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 2,2,2 > ${output_dir}${output_folder}"layers_and_nodes_2,2,2.txt"
Write-host "Finished 3 Hidden layer and 2 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 3,3,3 > ${output_dir}${output_folder}"layers_and_nodes_3,3,3.txt"
Write-host "Finished 3 Hidden layer and 3 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 4,4,4 > ${output_dir}${output_folder}"layers_and_nodes_4,4,4.txt"
Write-host "Finished 3 Hidden layer and 4 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 5,5,5 > ${output_dir}${output_folder}"layers_and_nodes_5,5,5.txt"
Write-host "Finished 3 Hidden layer and 5 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 2,2,2,2 > ${output_dir}${output_folder}"layers_and_nodes_2,2,2,2.txt"
Write-host "Finished 4 Hidden layer and 2 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 3,3,3,3 > ${output_dir}${output_folder}"layers_and_nodes_3,3,3,3.txt"
Write-host "Finished 4 Hidden layer and 3 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 4,4,4,4 > ${output_dir}${output_folder}"layers_and_nodes_4,4,4,4.txt"
Write-host "Finished 4 Hidden layer and 4 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 5,5,5,5 > ${output_dir}${output_folder}"layers_and_nodes_5,5,5,5.txt"
Write-host "Finished 4 Hidden layer and 5 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 2,2,2,2,2 > ${output_dir}${output_folder}"layers_and_nodes_2,2,2,2,2.txt"
Write-host "Finished 5 Hidden layer and 2 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 3,3,3,3,3 > ${output_dir}${output_folder}"layers_and_nodes_3,3,3,3,3.txt"
Write-host "Finished 5 Hidden layer and 3 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 4,4,4,4,4 > ${output_dir}${output_folder}"layers_and_nodes_4,4,4,4,4.txt"
Write-host "Finished 5 Hidden layer and 4 nodes"
java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir -H 5,5,5,5,5 > ${output_dir}${output_folder}"layers_and_nodes_5,5,5,5,5.txt"
Write-host "Finished 5 Hidden layer and 5 nodes"
#DEFAULT
# java -cp "C:\Program Files\Weka-3-8\weka.jar" weka.Run MultilayerPerceptron -t $training_dir -T $test_dir > ${output_dir}${output_folder}"default.txt"
# Write-host "Finished Test"
# }



# [console]::beep(500,100)
# [console]::beep(750,750)