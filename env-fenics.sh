#!/bin/bash
source ${HOME}/fenic-gaia/env-build-fenics.sh

# Note: These must be unset initially, need to code this in somehow.
export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}

# Bring in virtualenv with python package
source $HOME/.local/bin/virtualenvwrapper.sh
workon fenics-${TAG}

export DIJITSO_CACHE_DIR=${PREFIX}/.dijitso
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export OMP_NUM_THREADS=1
