#!/bin/bash

source /opt/intel/oneapi/modulefiles-setup.sh
source /opt/intel/oneapi/setvars.sh

TOdir = /home/master
wget https://www.netlib.org/benchmark/hpl/hpl-2.3.tar.gz $(TOdir)/hpl-2.3.tar.gz 
tar -zxvf $(TOdir)/hpl-2.3.tar.gz 

cp Make.Linux_Intel64 $(TOdir)/hpl-2.3/Make.Linux_Intel64

cd $(TOdir)/hpl-2.3 && make arch=Linux_Intel64