#!/bin/bash
#$ -q iblm.q
#$ -V
#$ -cwd
#$ -j y
#$ -l mem_free=1G
#$ -t 1-22497
#$ -tc 24
#$ -e log
#$ -o log
# 
# Usage:
#   $1 = file containing SRA ids

# enable conda
source /iblm/netapp/data2/mcuoco/miniconda3/etc/profile.d/conda.sh
conda activate get-data

DIR=$(pwd) # save base project dir
ACC_FILE=$1
ACC=`sed -n ${SGE_TASK_ID}p $ACC_FILE | awk '{print $1}'`

mkdir -p raw_fastq # create dir for fastq files

cd raw_fastq

if [ ! -f "${ACC}_1.fastq.gz" ]
then
prefetch $ACC
vdb-validate $ACC
fasterq-dump --split-files $ACC # get fastq files from acess
rm -r $ACC
gzip $ACC*fastq # compress

echo "downloaded $ACC succesfully"

# run fastqc
conda activate fastqc

fastqc $ACC*fastq.gz
fi
