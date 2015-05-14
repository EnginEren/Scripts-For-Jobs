#!/bin/bash

#remove messages of bird system
rm run_fit_*.sh.e*
rm run_fit_*.sh.o*

#move shell scripts to another folder named old_jobs
mv run_fit_*.sh old_jobs

exit 0;
