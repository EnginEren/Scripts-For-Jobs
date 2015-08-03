#!/bin/zsh
#
#
# This is a modified SGE batch script
# run with:   qsub -l h_vmem=3G -l h_rt=24:00:00 -l os=sld6 -cwd run_fit.sh

# request Bourne shell as shell for job
#$ -S /bin/zsh

#
# 
JOBNAME=hera_only-14p-13p+ZFbar

echo "$QUEUE $JOB $HOST $JOBNAME"

export MYDIR=/afs/desy.de/group/herafitter/users/eren
export NFS=/nfs/dust/cms/user/eren

md=$(date +"%T-%m-%d-%Y")
mkdir $NFS/pbs/WA/$JOBNAME$JOB.$md
cd $NFS/pbs/WA/$JOBNAME$JOB.$md

# first copy all what we need: 
cp -r $MYDIR/WAysm/herafitter-1.1.1/bin .
ln -s $MYDIR/WAysm/herafitter-1.1.1/datafiles datafiles
ln -s $MYDIR/WAysm/herafitter-1.1.1/theoryfiles theoryfiles
cp $MYDIR/WAysm/herafitter-1.1.1/* .
mkdir output
rm *out -f
rm *eps -f
rm *tex -f
rm *pdf -f


#!/bin/zsh
#
# request Bourne shell as shell for job
#$ -S /bin/zsh
# 

# setup
echo "setting up enviroment"
echo
# compiler
. /afs/cern.ch/sw/lcg/contrib/gcc/4.6/x86_64-slc6-gcc46-opt/setup.sh

# root
cd  /afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.14/x86_64-slc6-gcc46-opt/root/
.  /afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.14/x86_64-slc6-gcc46-opt/root/bin/thisroot.sh
cd -

export PATH=$MYDIR/hoppet/bin/:$PATH
export PATH=$MYDIR/lhapdf/bin/:$PATH
export PATH=$MYDIR/applgrid/bin/:$PATH

export QCDNUM_ROOT=$MYDIR/qcdnum-17-00-06

export LD_LIBRARY_PATH=$MYDIR/hoppet/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$MYDIR/lhapdf/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$MYDIR/applgrid/lib/:$LD_LIBRARY_PATH

echo $LD_LIBRARY_PATH

echo '--------------------------'
echo '          done            '
echo '--------------------------'
echo

# run
bin/FitPDF > out.log


echo "done"


