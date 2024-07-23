#!/usr/bin/env bash
# Created on: 12/15/22, 4:05 PM

# download and install micromamba
echo "Downloading micromamba..."
curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj $HOME/bin/micromamba

$HOME/bin/micromamba shell init -s bash -p $HOME/conda  # this writes to your .bashrc file
echo "alias mamba=micromamba" >> $HOME/.bashrc
echo "alias conda=micromamba" >> $HOME/.bashrc

