#!usr/bin/env bash

# enable conda
source /iblm/netapp/data2/mcuoco/miniconda3/etc/profile.d/conda.sh
conda activate get-data

set -e  
while read line  
do  
  FILE=$(basename $line)
  if [ ! -f "$FILE" ]; then
    aws s3 cp $line . --no-sign-request
  fi
done < $1

