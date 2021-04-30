#!/bin/bash

source /opt/intel/oneapi/modulefiles-setup.sh
source /opt/intel/oneapi/setvars.sh

apt install mpich

#HPL

TOdir = /home/master
wget https://www.netlib.org/benchmark/hpl/hpl-2.3.tar.gz $(TOdir)/hpl-2.3.tar.gz 
tar -zxvf $(TOdir)/hpl-2.3.tar.gz 

cp Make.Linux_Intel64 $(TOdir)/hpl-2.3/Make.Linux_Intel64

cd $(TOdir)/hpl-2.3 && make arch=Linux_Intel64

# HPCG
wget http://www.hpcg-benchmark.org/downloads/hpcg-3.1.tar.gz
tar xvzf hpcg-3.1.tar.gz && cd hpcg-3.1

cp setup/Make.Linux_MPI . 
mkdir build &&& cd build
../configure Linux_MPI && make -j 12
cd ../ && cp -a build /heom/master/hpcg