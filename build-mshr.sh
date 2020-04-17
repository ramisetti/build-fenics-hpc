#!/bin/bash
source env-build-fenics.sh

# The ProgramOptions did not link on the Easybuild Boost, need to build Boost as well.
# Follow directions on boost.org with --prefix=$HOME/stow/boost before running script.
mkdir -p $BUILD_DIR

source $HOME/.local/bin/virtualenvwrapper.sh
workon fenics-${TAG}

cd $BUILD_DIR && \
    git clone https://bitbucket.org/fenics-project/mshr.git && \
    cd mshr && \
    mkdir -p build && \
    cd build && \
    cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${PREFIX} && \
    make -j ${BUILD_THREADS} && \
    make install && \
    cd ../python/ && \
    ${FENICS_PYTHON} setup.py install
