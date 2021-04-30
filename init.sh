#!/bin/bash

if [ $HOSTNAME = "apollo17" ]
then
    ip addr add 10.66.66.17/24 dev enp4s0f0
else 
    ip addr add 10.66.66.18/24 dev enp4s0f0
fi

# install basic tool
apt install tmux htop build-essential vim gnupg2



