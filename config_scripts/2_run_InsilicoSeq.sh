#!/bin/bash -l
#SBATCH --job-name=InSilico
#SBATCH --account=
#SBATCH --output=errout/outputr%j.txt
#SBATCH --error=errout/errors_%j.txt
#SBATCH --partition=small
#SBATCH --time=12:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=30
#SBATCH --mem-per-cpu=4000


# load job configuration
cd $SLURM_SUBMIT_DIR
source config_scripts/config.sh

# load environment
source $CONDA/etc/profile.d/conda.sh
conda activate insilicoseq

# echo for log
echo "job started"; hostname; date

# setup
if [ ! -d "$RESULT_DIR/mock_metagenomes" ] ; then
    mkdir $RESULT_DIR/mock_metagenomes
fi

cd $RESULT_DIR/mock_metagenomes

# Get mock profile ID
IN_LIST="$RESULT_DIR/profiles/files.list"
export MOCK=`head -n +${SLURM_ARRAY_TASK_ID} $IN_LIST | tail -n 1`
export MOCK_FILE="$RESULT_DIR/profiles/$MOCK"

export GEN_NAME="HiSeq50k_${MOCK%%.txt}"
iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE --n_reads 0.05M -m HiSeq -o $GEN_NAME
gzip ${GEN_NAME}_R1.fastq
rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="HiSeq100K_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE --n_reads 0.1M -m HiSeq -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="HiSeq500K_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE --n_reads 0.5M -m HiSeq -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="HiSeq1M_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE -m HiSeq -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="HiSeq5M_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE --n_reads 5M -m HiSeq -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="HiSeq10M_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE --n_reads 10M -m HiSeq -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="HiSeq50M_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE --n_reads 50M -m HiSeq -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#####################################################

#export GEN_NAME="MiSeq50k_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE -m MiSeq --n_reads 0.05M -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="MiSeq100K_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE -m MiSeq --n_reads 0.1M -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="MiSeq500K_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE -m MiSeq --n_reads 0.5M -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="MiSeq1M_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE -m MiSeq -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="MiSeq5M_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE -m MiSeq --n_reads 5M -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="MiSeq10M_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE -m MiSeq --n_reads 10M -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="MiSeq50M_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE -m MiSeq --n_reads 50M -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#####################################################

#export GEN_NAME="NovaSeq50k_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE -m NovaSeq --n_reads 0.05M -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="NovaSeq100K_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE -m NovaSeq --n_reads 0.1M -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="NovaSeq500K_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE -m NovaSeq --n_reads 0.5M -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="NovaSeq1M_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE -m NovaSeq -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="NovaSeq5M_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE -m NovaSeq --n_reads 5M -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="NovaSeq10M_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE -m NovaSeq --n_reads 10M -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq

#export GEN_NAME="NovaSeq50M_${MOCK%%.txt}"
#iss generate -g $REF_GENOMES --abundance_file $MOCK_FILE -m NovaSeq --n_reads 50M -o $GEN_NAME
#gzip ${GEN_NAME}_R1.fastq
#rm ${GEN_NAME}_R2.fastq
