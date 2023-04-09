#!/bin/bash -l

# load job configuration
source config_scripts/config.sh

#
#makes sure sample file is in the right place
#
IN_LIST="$RESULT_DIR/profiles/files.list"
if [[ ! -f "$IN_LIST" ]]; then
    echo "$IN_LIST does not exist. Please run the profile generator first. Job terminated."
    exit 1
fi

if [[ ! -d "errout" ]]; then
        mkdir errout
fi

# get number of samples to process
export NUM_JOB=$(wc -l < "$IN_LIST")

# submit co_assemblies
echo "launching 2_run_InsilicoSeq.sh as a job."

JOB_ID=`sbatch --job-name InSilicoSeq -a 1-$NUM_JOB config_scripts/2_run_InsilicoSeq.sh`
