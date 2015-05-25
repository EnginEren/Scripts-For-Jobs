#!/bin/bash

#Usage : ./read_status /nfs/dust/cms/user/eren/pbs/hera_cms8TeV-10p+Edv+Eg+Duv+NeG+Ddv.10:19:25-05-21-2015 

#To see the chi2
cat $1/output/Results.txt | grep "After"

#To see the migrad and hesse
cat $1/output/minuit.out.txt | grep "MIGRAD"
cat $1/output/minuit.out.txt | grep "HESSE"

#IMPORTANT NOTE: Sometimes you might not understand whether the fit is converged or not by just looking the script output. Please be %100 sure and use ./DrawPDFs
 
exit 0
