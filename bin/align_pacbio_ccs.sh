# align pacbio reads 
# Usage:
# 	1 = list of fastq files
#	2 = reference fasta file

fastqs=$1
ref=$2
prefix="${ref%.*}"

echo "indexing $ref"
pbmm2 index $ref $prefix.mmi


for i in "${fastqs[@]}"
do
	prefix="${i%.*}"
	echo "aligning $i"
	pbmm2 align $ref $i $i.bam --preset CCS --sort --rg '@RG\tID:myid\tSM:mysample'
done