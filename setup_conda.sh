#!/usr/bin/env bash
# Created on: 12/15/22, 4:05 PM
# TODO: add option for custom prefix

curl -L -O  https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-pypy3-Linux-x86_64.sh > Mambaforge-pypy3-Linux-x86_64.sh
bash Mambaforge-pypy3-Linux-x86_64.sh -b -p "${HOME}/conda"
rm -f Mambaforge-pypy3-Linux-x86_64.sh
source "${HOME}/conda/etc/profile.d/conda.sh"
conda init bash

# move conda init to .extra
start=$(grep -n ">>> conda initialize >>>" $HOME/.bashrc | cut -d: -f1)
end=$(grep -n "<<< conda initialize <<<" $HOME/.bashrc | cut -d: -f1)
touch .extra
sed -n "${start},${end}p" $HOME/.bashrc >> .extra
head -n+"$(expr $start - 1)" $HOME/.bashrc > $HOME/.bashrc