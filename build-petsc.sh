#!/bin/bash
source env-build-fenics.sh

VERSION="3.11.4"

mkdir -p $BUILD_DIR

cd ${BUILD_DIR} && \
   wget --read-timeout=10 -nc http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-${VERSION}.tar.gz -O petsc.tar.gz && \
   mkdir -p ${BUILD_DIR}/petsc && \
   tar -xf petsc.tar.gz -C ${BUILD_DIR}/petsc --strip-components=1 && \
   cd petsc && \
   python3 ./configure \
               --download-fblaslapack \
               --COPTFLAGS="-march=native -O2" \
               --CXXOPTFLAGS="-march=native -O2" \
               --FOPTFLAGS="-march=native -O2" \
               --with-cc=mpicc --with-cxx=mpicxx --with-fc=mpif90 \
               --with-mpiexec=mpiexec \
               --with-cxx-dialect=C++11 \
               --download-metis \
               --download-parmetis \
               --download-ptscotch \
               --download-suitesparse \
               --download-scalapack \
               --download-scotch \
               --download-hypre \
               --download-mumps \
               --download-superlu \
               --download-superlu_dist \
               --download-triangle \
               --download-sundials \
               --download-hdf5 \
               --download-ml \
               --with-debugging=0 \
               --with-shared-libraries \
               --with-fortran-bindings=0 \
               --prefix=${PREFIX} && \
    make && \
    make install
