#!/bin/bash
source env-build-fenics.sh

source $HOME/.local/bin/virtualenvwrapper.sh
workon fenics-${TAG}

export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}
export PYBIND11_DIR=${PREFIX}

DIJITSO_BRANCH="2019.1.0"
UFL_BRANCH="2019.1.0"
FIAT_BRANCH="2019.1.0"
FFC_BRANCH="2019.1.0"
DOLFIN_BRANCH="2019.1.0.post0"

mkdir -p $BUILD_DIR


cd $BUILD_DIR && \
    git clone https://bitbucket.org/fenics-project/dijitso.git && \
    cd dijitso && \
    git checkout ${DIJITSO_BRANCH} && \
    ${FENICS_PYTHON} setup.py install

sleep 5

cd $BUILD_DIR && \
   git clone https://bitbucket.org/fenics-project/ufl.git
   cd ufl && \
   git checkout ${UFL_BRANCH} && \
   ${FENICS_PYTHON} setup.py install

sleep 5

cd $BUILD_DIR && \
   git clone https://bitbucket.org/fenics-project/fiat.git && \
   cd fiat && \
   git checkout ${FIAT_BRANCH} && \
   ${FENICS_PYTHON} setup.py install

sleep 5

cd $BUILD_DIR && \
    git clone https://bitbucket.org/fenics-project/ffc.git && \
    cd ffc && \
    git checkout ${FFC_BRANCH} && \
    ${FENICS_PYTHON} setup.py install

sleep 5

cd $BUILD_DIR && \
   git clone https://bitbucket.org/fenics-project/dolfin.git && \
   cd dolfin && \
   git checkout ${DOLFIN_BRANCH} && \
   mkdir -p build && \
   cd build && \
   cmake ../ -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release && \
   make && \
   make install

sleep 5

cd $BUILD_DIR/dolfin/python && \
   ${FENICS_PYTHON} setup.py install
