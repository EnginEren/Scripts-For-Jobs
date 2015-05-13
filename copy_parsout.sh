#!/bin/bash

cp $1/output/parsout_1 tmp.txt
sed -i "1i set title" tmp.txt
sed -i "2i new  13p HERAPDF" tmp.txt
sed -i "3i parameters" tmp.txt

echo -en "\n" >> tmp.txt
echo -en "\n" >> tmp.txt
echo -en "\n" >> tmp.txt

cat minuit.last6lines.txt >> tmp.txt
mv tmp.txt minuit.in.txt

exit 0
