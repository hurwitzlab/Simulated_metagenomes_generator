#!/bin/sh
set -u
#
# Checking args
#

source config_scripts/config.sh

if [[ ! -d "$RESULT_DIR" ]]; then
  echo "$RESULT_DIR does not exist. Directory created"
  mkdir $RESULT_DIR
fi

#
## 01-run abundance vectors
#
echo "launching $SCRIPT_DIR/1_run_abundance_vectors.sh "

JOB_ID=`sbatch --job-name Generator config_scripts/1_run_abundance_vectors.sh`

if [ "${JOB_ID}x" != "x" ]; then
    echo Job: \"$JOB_ID\"
    PREV_JOB_ID=$JOB_ID  
else
    echo Problem submitting job. Job terminated
fi
    
echo "job successfully submited"


