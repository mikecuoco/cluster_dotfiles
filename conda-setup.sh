#!/usr/bin/env bash
# Created on: 12/15/22, 4:05 PM

# write command line help message
function usage() {
	echo "Usage: $0 [-p <prefix>]" 1>&2;
	echo "  -p <prefix path>  :  prefix path to install conda to (ie $HOME will install $HOME/conda)" 1>&2;
	exit 1;
}

# check if arguments are passed
if [ $# -eq 0 ]; then
	usage
else
	# parse arguments
	while getopts ":p:" o; do
		case "${o}" in
			p)
				PREFIX_PATH=${OPTARG}
				;;
			*)
				usage
				;;
		esac
	done
fi

# download and install mambaforge
echo "Downloading latest version of Mambaforge"
curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-pypy3-Linux-x86_64.sh > Mambaforge-pypy3-Linux-x86_64.sh
bash Mambaforge-pypy3-Linux-x86_64.sh -b -p "$PREFIX_PATH/conda"
rm -f Mambaforge-pypy3-Linux-x86_64.sh
source "$PREFIX_PATH/conda/etc/profile.d/conda.sh"
conda init bash

# move conda init to .extra
start=$(grep -n ">>> conda initialize >>>" $HOME/.bashrc | cut -d: -f1)
end=$(grep -n "<<< conda initialize <<<" $HOME/.bashrc | cut -d: -f1)
touch .extra
sed -n "${start},${end}p" $HOME/.bashrc >> .extra
head -n+"$(expr $start - 1)" $HOME/.bashrc > $HOME/.bashrc