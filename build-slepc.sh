#!/bin/bash
source env-build-fenics.sh

SLEPC_VERSION="3.11.2"
export PETSC_DIR=${PREFIX}
#echo "Using PETSC from " $PETSC_DIR
mkdir -p $BUILD_DIR

cd ${BUILD_DIR} && \
   wget --read-timeout=10 -nc http://slepc.upv.es/download/distrib/slepc-${SLEPC_VERSION}.tar.gz -O slepc.tar.gz && \
   mkdir -p ${BUILD_DIR}/slepc && \
   tar -xf slepc.tar.gz -C ${BUILD_DIR}/slepc --strip-components=1 && \
   cd slepc && \
   python3 ./configure --prefix=${PREFIX} && \
   make SLEPC_DIR=${PWD} all && \
   make install
