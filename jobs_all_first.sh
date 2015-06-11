#!/bin/bash

BASE=10p

FILE=par_list
LIST=$(egrep -v "^#" $FILE)

for par in $LIST; do
	echo $par
	./change_var.sh $par 0.1 0.01
	./mrun_fit.sh $BASE+$par
	sleep 30;
done


exit 0;
