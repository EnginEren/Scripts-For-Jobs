#!/bin/bash

LIST=$(ls $PBS | grep "$1")

for job in $LIST; do
	cat $PBS/$job/output/parsout_1 | grep "$1"
done


#cat $PBS/*$1*/output/parsout_1 | grep "$1"

exit 0

