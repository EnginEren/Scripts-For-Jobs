#!/bin/bash

BASE=10p+Edv+Eg+Duv+NeG+DUbar

FILE=par_list
LIST=$(egrep -v "^#" $FILE)

for par in $LIST; do
	echo $par
	par_val=$(./par_value.sh $par | awk '{print $1}')
	par_error=$(./par_value.sh $par | awk '{print $2}')
	./change_var.sh $par $par_val $par_error
	./mrun_fit.sh $BASE+$par
	sleep 30;
done


exit 0;
