#!/bin/bash
#set -e

source env-build-fenics.sh

unset PETSC_DIR; unset PETSC_ARCH; unset PKG_CONFIG_PATH; unset SLEPC_DIR; unset HDF5_DIR
export CC=gcc; export CXX=g++

./build-petsc.sh
./build-slepc.sh
./build-eigen.sh
./build-pybind11.sh
./build-python-modules.sh
./build-fenics.sh
