#!/bin/bash

# use wget to fetch the Intel repository public key
wget -qO- https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB | apt-key add -
# add to your apt sources keyring so that archives signed with this key will be trusted.
# remove the public key

apt install -y gnupg software-properties-common

# Configure the APT client to use Intel's repository
echo "deb https://apt.repos.intel.com/oneapi all main" | sudo tee /etc/apt/sources.list.d/oneAPI.list
add-apt-repository "deb https://apt.repos.intel.com/oneapi all main"

# Install One-api HPC toolkit
apt update && apt install -y intel-hpckit

# source shell env 
source /opt/intel/oneapi/setvars.sh
source /opt/intel/oneapi/modulefiles-setup.sh
