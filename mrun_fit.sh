#!/bin/zsh

#Usage : ./mrun_fit.sh 10p+Ddv

#Get job name, what is defined in run_fit.sh
JOB=$(grep "JOBNAME=" run_fit.sh)

#Create a new shell script and copy everything from run_fit.sh
touch run_fit_$1.sh
cp run_fit.sh run_fit_$1.sh

#Edit job name in our new script
sed -i "s/$JOB/JOBNAME=hera2_cms8TeV-$1/" run_fit_$1.sh
#sed -i "s/$JOB/JOBNAME=hera_only-$1/" run_fit_$1.sh

#Make it executable
chmod +x run_fit_$1.sh

#Give this new script in to bird system
qsub -l h_vmem=3G -l h_rt=24:00:00 -l os=sld6 -cwd run_fit_$1.sh
#qsub -q short.q -l h_vmem=2G -l h_rt=24:00:00 -l os=sld6 -cwd run_fit_$1.sh


exit 0
