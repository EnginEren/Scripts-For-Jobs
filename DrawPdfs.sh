#!/bin/bash

qstat -r | grep Full
ls -ltrh $PBS/WA | grep $1 | awk '{print $9}' 
read folder1 folder2 folder3 folder4 folder5 folder6 

count=13p
Draw() {
	
	VAR1=$(echo $1  | awk -F. '{print $1}' | awk -F"-" '{print $3}' | awk -F"+" '{print $4}')
	VAR2=$(echo $2  | awk -F. '{print $1}' | awk -F"-" '{print $3}' | awk -F"+" '{print $5}')
	VAR3=$(echo $3  | awk -F. '{print $1}' | awk -F"-" '{print $3}' | awk -F"+" '{print $5}')
	VAR4=$(echo $4  | awk -F. '{print $1}' | awk -F"-" '{print $3}' | awk -F"+" '{print $5}')
	VAR5=$(echo $5  | awk -F. '{print $1}' | awk -F"-" '{print $3}' | awk -F"+" '{print $5}')
	VAR6=$(echo $6  | awk -F. '{print $1}' | awk -F"-" '{print $3}' | awk -F"+" '{print $5}')
	./bin/DrawPdfs $PBS/WA/$1/output:$count $PBS/WA/$2/output:$count+$VAR2 $PBS/WA/$3/output:$count+$VAR3 $PBS/WA/$4/output:$count+$VAR4 $PBS/WA/$5/output:$count+$VAR5 $PBS/WA/$6/output:$count+$VAR6
	
}

Draw $folder1 $folder2 $folder3 $folder4 $folder5 $folder6
exit 0;

