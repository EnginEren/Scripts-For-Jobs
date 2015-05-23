#!/bin/bash

cat $1/output/Results.txt | grep "After"
cat $1/output/minuit.out.txt | grep "MIGRAD"
cat $1/output/minuit.out.txt | grep "HESSE"

exit 0
