#!usr/bin/env bash
# Download SRA files from list
# Input = list of SRA accessions

set -e  

# enable conda
if ! command -v 'prefetch' &>/dev/null && \
  command -v 'conda' && \
  [ "$CONDA_DEFAULT_ENV" != "get-data" ] && \
  conda info --envs | grep "$CONDA_PREFIX/envs/get-data" $>/dev/null; then
    printf "\n\e[0;35m Attempting to switch to get-data environment \e[0m\n\n"
    eval "$(conda shell.bash hook)"
    conda activate get-data
fi

DIR=$(pwd) # save base project dir
ACC_FILE=$1

mkdir -p raw_fastq # create dir for fastq files

cd raw_fastq

while read -r ACC
do
	if [ ! -f "${ACC}_1.fastq.gz" ]
	then
	prefetch $ACC && \  # prefetch to improve speed and validate
	vdb-validate $ACC && \  # validate
	fasterq-dump --split-files $ACC && \  # get fastq files from accession
	rm -r $ACC
	gzip $ACC*fastq # compress

	echo "downloaded $ACC succesfully"
	fi
done < $ACC_FILE
