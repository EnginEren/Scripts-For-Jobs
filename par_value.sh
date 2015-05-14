#!/bin/bash

#Usage : ./par_value.sh DDbar 
#$PBS is defined where the output directories are.

#Get the list of output directories which they contain specified variable name (E.g "DUbar")
LIST=$(ls $PBS | grep "$1")

#Loop and print every specified output directories
for job in $LIST; do
	cat $PBS/$job/output/parsout_1 | grep "$1"
done


exit 0

