#!/usr/bin/env bash
# Author: Mike Cuoco
# Created on: 8/22/23, 3:49 PM
#
# Instructions to install singularity on a linux system

# check if sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

cd $HOME

# Install basic tools for compiling
sudo yum groupinstall -y 'Development Tools'
# Install RPM packages for dependencies
sudo yum install -y \
   libseccomp-devel \
   glib2-devel \
   squashfs-tools \
   cryptsetup \
   runc

# setup go
sudo wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
sudo tar -C /usr/local/ -xzvf go1.21.0.linux-amd64.tar.gz
echo 'export GOPATH=${HOME}/go' >> ~/.extra 
echo 'export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin' >> ~/.extra 
source ~/.extra

# install singularity
wget https://github.com/sylabs/singularity/releases/download/v3.11.4/singularity-ce-3.11.4-1.el7.x86_64.rpm
sudo yum install -y singularity-ce-3.11.4-1.el7.x86_64.rpm

# verify 
singularity --version