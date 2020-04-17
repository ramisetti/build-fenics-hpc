#!/bin/bash
source env-build-fenics.sh

export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}

PETSC4PY_VERSION=3.11.0
SLEPC4PY_VERSION=3.11.0

# uncomment if not installing petsc from build-all script
export VIRTUALENVWRAPPER_PYTHON=`which ${FENICS_PYTHON}`
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV=~/.local/bin/virtualenv
source ~/.local/bin/virtualenvwrapper.sh

${FENICS_PYTHON} -m pip install --user virtualenv virtualenvwrapper

source $HOME/.local/bin/virtualenvwrapper.sh
mkvirtualenv --system-site-packages --python=${FENICS_PYTHON} fenics-${TAG}
workon fenics-${TAG}

${FENICS_PYTHON} -m pip install --timeout 100 --no-cache-dir --no-binary h5py numexpr mpi4py && \
${FENICS_PYTHON} -m pip install --timeout 100 --no-cache-dir https://bitbucket.org/petsc/petsc4py/downloads/petsc4py-${PETSC4PY_VERSION}.tar.gz && \
${FENICS_PYTHON} -m pip install --timeout 100 --no-cache-dir ipython ply sympy==1.1.1
