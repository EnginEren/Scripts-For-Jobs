#!/bin/bash

#Usage : ./par_value.sh DDbar 
#$PBS is defined where the output directories are.

#Get the list of output directories which they contain specified variable name (E.g "DUbar")
LIST=$(ls $PBS | grep "$1")

#Define and initialize loop counter and aggregate 
sum_value=0
sum_value_e=0;
count=0

#Loop over every specified output directories
#Sum parameter and error values in the loop
for job in $LIST; do
	value=$(cat $PBS/$job/output/parsout_1 | grep "$1" | awk '{print $3}') 
	error=$(cat $PBS/$job/output/parsout_1 | grep "$1" | awk '{print $4}')
	sum_value=$(awk "BEGIN {print $sum_value+$value; exit}")
	sum_value_e=$(awk "BEGIN {print $sum_value_e+$error; exit}")
	count=$((count+1))	
done

#Calculate the averages and print
average=$(awk "BEGIN {print $sum_value/$count; exit}")
average_e=$(awk "BEGIN {print $sum_value_e/$count; exit}")
echo $average $average_e
exit 0

