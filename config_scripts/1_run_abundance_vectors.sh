#!/bin/bash
#SBATCH --job-name=Generator
#SBATCH --account=
#SBATCH --output=errout/outputr%j.txt
#SBATCH --error=errout/errors_%j.txt
#SBATCH --partition=small
#SBATCH --time=01:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=1000

# load job configuration
cd $SLURM_SUBMIT_DIR
source config_scripts/config.sh

# load environment
source $CONDA/etc/profile.d/conda.sh
conda activate Generator

# echo for log
echo "job started"; hostname; date

# run script
RUN="$WORKER_DIR/vector_generates.py"

OUT="$RESULT_DIR/profiles"
if [ ! -d "$OUT" ] ; then
    mkdir $OUT
fi

python $RUN -f $LIST_GENOMES -v $VEC_ABUNDANCE -m $NB_METAGENOMES -o $OUT

cd $OUT
find *.txt > files.list

echo "Finished `date`">>"$LOG"
