#!/bin/bash

list=$(ls -ltrh $PBS/WA | grep $1 | awk '{print $9}')

for i in $(echo $list); do
	echo $i
	cat $PBS/WA/$i/output/Results.txt | grep "After" | awk '{print $3}'
	#cat $PBS/WA/$i/output/minuit.out.txt | grep "MIGRAD"
	#cat $PBS/WA/$i/output/minuit.out.txt | grep "HESSE"
done

exit 0
