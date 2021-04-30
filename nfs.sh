#!/bin/bash

if [ $HOSTNAME = "apollo17" ]
then
    echo "Detect hostname is apollo17"
    echo "Install NFS server"
    apt install nfs-kernel-server 
    echo '/home/ 192.168.66.18(fsid=0,rw,async,insecure,no_subtree_check,no_root_squash)' > /etc/exports
    modprobe svcrdma > /dev/null 2>&1
    echo "rdma 20049" > /proc/fs/nfsd/portlist
    echo "==== /proc/fs/nfsd/portlist ===="
    cat /proc/fs/nfsd/portlist
    echo "================================"
    systemctl restart nfs-kernel-server

elif [ $HOSTNAME = "apollo18" ]
then
    echo "Detect hostname is apollo18"
    echo "Install NFS client"
    modprobe xprtrdma > /dev/null 2>&1
    apt install nfs-common
    mount -o rdma,port=20049 192.168.66.17:/home /home
    echo "Show mount arg."
    mount | grep /home
fi