#!/bin/zsh

JOB=$(grep "JOBNAME=" run_fit.sh)
touch run_fit_$1.sh
cp run_fit.sh run_fit_$1.sh
sed -i "s/$JOB/JOBNAME=hera_cms8TeV-$1/" run_fit_$1.sh
#sed -i "s/$JOB/JOBNAME=hera_only-$1/" run_fit_$1.sh
chmod +x run_fit_$1.sh
qsub -l h_vmem=3G -l h_rt=24:00:00 -l os=sld6 -cwd run_fit_$1.sh


exit 0
