#!/usr/bin/env bash
# Download from aws s3 bucket without sign-in request
# Input = list of aws s3 paths

set -e  

# enable conda
if ! command -v 'aws' &>/dev/null && \
  command -v 'conda' && \
  [ "$CONDA_DEFAULT_ENV" != "get-data" ] && \
  conda info --envs | grep "$CONDA_PREFIX_1/envs/get-data" $>/dev/null; then
    printf "\n\e[0;35m Attempting to switch to get-data environment \e[0m\n\n"
    eval "$(conda shell.bash hook)"
    conda activate get-data
fi

while read line  
do  
  FILE=$(basename $line)
  if [ ! -f "$FILE" ]; then
    aws s3 cp $line . --no-sign-request
  fi
done < $1

