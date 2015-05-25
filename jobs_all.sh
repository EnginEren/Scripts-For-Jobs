#!/bin/bash

#Usage : ./jobs_all.sh
#Make sure that you have a paremeter list : par_list

#Make a base 
BASE=10p+Edv+Eg+Duv+NeG+DUbar

#Define parameter list file and make it ready for loop
FILE=par_list
LIST=$(egrep -v "^#" $FILE)

#Start the loop
for par in $LIST; do
	echo $par
	#Get average parameter value and error using par_value.sh script
	par_val=$(./par_value.sh $par | awk '{print $1}')
	par_error=$(./par_value.sh $par | awk '{print $2}')
	#Give these values to change_var.sh script
	./change_var.sh $par $par_val $par_error
	#Now you changed the minuit file and you can run the job script
	./mrun_fit.sh $BASE+$par
	#Sleep is for precaution
	sleep 30;
done


exit 0;
