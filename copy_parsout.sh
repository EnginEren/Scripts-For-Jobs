#!/bin/bash

#.../herafitter-1-1-1
#This script inputs jobs name, please give full path.
#This script is usefull when you want to repeat the job with what is written in parsout_1 file. 


#Copy parsout into temporary file
cp $1/output/parsout_1 tmp.txt

#Edit first three lines 
sed -i "1i set title" tmp.txt
sed -i "2i new  13p HERAPDF" tmp.txt
sed -i "3i parameters" tmp.txt

#Add three new lines to the end of the file
echo -en "\n" >> tmp.txt
echo -en "\n" >> tmp.txt
echo -en "\n" >> tmp.txt

#Append standart stuff. Last six lines of standart minuit.in.txt
cat minuit.last6lines.txt >> tmp.txt

#change the name of tmp.txt to minuit.in.txt
mv tmp.txt minuit.in.txt

exit 0
