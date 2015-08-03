#!/bin/bash

#Usage : ./par_value.sh DDbar 
#$PBS is defined where the output directories are.

#Get the list of output directories which they contain specified variable name (E.g "DUbar")
LIST=$(ls $PBS/WA | grep "$1")
sum_value=0
sum_value_e=0;
count=0
#Loop and print every specified output directories
for job in $LIST; do
	#echo $job
	#cat $PBS/$job/output/parsout_1 | grep "$1" 
	value=$(cat $PBS/WA/$job/output/parsout_1 | grep "$1" | awk '{print $3}') 
	error=$(cat $PBS/WA/$job/output/parsout_1 | grep "$1" | awk '{print $4}')
	if [ -z "$value" ] && [ -z "$error" ]; then
		value=0.000
		error=0.000
	fi
	sum_value=$(awk "BEGIN {print $sum_value+$value; exit}")
	sum_value_e=$(awk "BEGIN {print $sum_value_e+$error; exit}")
	count=$((count+1))	
done

#echo $sum_value $count
average=$(awk "BEGIN {print $sum_value/$count; exit}")
average_e=$(awk "BEGIN {print $sum_value_e/$count; exit}")
echo $average $average_e
exit 0

