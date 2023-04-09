#!/bin/bash -l
#place to store the scripts
export SCRIPT_DIR="$PWD/config_scripts"
export WORKER_DIR="$SCRIPT_DIR/workers"
export INPUT_DIR="$PWD/input_files"
# conda directory
CONDA=
# where the dataset to prepare is
export VEC_ABUNDANCE="$INPUT_DIR/vect_50org.txt"
export LIST_GENOMES="$INPUT_DIR/mock_genomes.txt"
export RESULT_DIR="$PWD/output_pipeline"
# parameters
export REF_GENOMES="$INPUT_DIR/Fam_Mycobacterium_all.fasta"
export NB_METAGENOMES=100 #nb metagenomes to generate

#
# --------------------------------------------------
function init_dir {
    for dir in $*; do
        if [ -d "$dir" ]; then
            rm -rf $dir/*
        else
            mkdir -p "$dir"
        fi
    done
}

# --------------------------------------------------
function lc() {
    wc -l $1 | cut -d ' ' -f 1
}
