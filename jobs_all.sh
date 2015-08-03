#!/bin/bash

echo "Please define your base. (Example : 10p+Eg)"
read BASE
echo "Please specify your input minuit in input steering folder"
ls -ltrh input_steering
read minuit
OLD=$(cat change_var.sh | grep MINUIT | head -n 1) 
NEW="MINUIT=\"$minuit\""
sed -i 's/'$OLD'/'$NEW'/' change_var.sh

FILE=par_list
LIST=$(egrep -v "^#" $FILE)

for par in $LIST; do
	echo $par
	if [ $par == "Bdv" ];then
		./change_var.sh $par 0.10 0.10
	        ./mrun_fit.sh $BASE+$par	
	else
		./change_var.sh $par 0.00 0.10
		./mrun_fit.sh $BASE+$par
	fi
	sleep 60;
done


exit 0;
