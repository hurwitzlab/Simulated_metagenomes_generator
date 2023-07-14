#!/bin/bash
#SBATCH --job-name=installation
#SBATCH --account=
#SBATCH --output=outputr%j.txt
#SBATCH --error=errors_%j.txt
#SBATCH --partition=small
#SBATCH --time=01:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=40
#SBATCH --mem-per-cpu=4000

CONDA="/scratch/project_2004512/tools/MiniConda3"
source $CONDA/etc/profile.d/conda.sh

## WARNING: this environment is hard to install. Lots of dependencies. Use pip upgrade to help.

#conda create -n Generator python=3.9
#conda activate Generator
#conda install -c anaconda numpy
#conda install -c anaconda scikit-learn
#conda install -c anaconda biopython
#conda install -c conda-forge joblib
#conda install -c bioconda pysam
#conda install -c conda-forge scipy
#conda deactivate 

#conda create -n insilicoseq python=3.9
conda activate insilicoseq
conda install -c bioconda insilicoseq
conda install -c anaconda biopython
conda install -c conda-forge scipy
conda install -c anaconda numpy
conda install -c anaconda scikit-learn
conda install -c conda-forge joblib
pip install pysam
pip install future
pip install requests
pip install --upgrade InSilicoSeq
conda deactivate

