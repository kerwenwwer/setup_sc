#!/bin/bash

# import some modules 
modprobe rdmavt rdma_ucm rdma_rxe rdma_cm ib_uverbs ib_iser ib_ipoib ib_cm ib_umad ib_core mlx4_en mlx4_ib mlx4_core      

# Install all package
apt install -y libmlx4-1 infiniband-diags ibutils ibverbs-utils rdmacm-utils perftest open-iscsi rdma-core tgt cmake pkg-config

IBDEV=$(find /sys/class/net ! -type d | xargs --max-args=1 realpath  | awk -F\/ '/pci/{print $NF}' | grep ib)

if [ $HOSTNAME = "apollo17" ]
then
    echo "Detect hostname is apollo17"
    sed -i '$a\auto '"$IBDEV"'\niface '"$IBDEV"' inet static\n\taddress 192.168.66.17/24' /etc/network/interfaces 
elif [ $HOSTNAME = "apollo18" ]
then
    echo "Detect hostname is apollo18"
    sed -i '$a\auto '"$IBDEV"'\niface '"$IBDEV"' inet static\n\taddress 192.168.66.18/24' /etc/network/interfaces
fi

systemctl restart networking

echo connected > /sys/class/net/ibp3s0/mode
ip link set dev ibp3s0 mtu 65520
