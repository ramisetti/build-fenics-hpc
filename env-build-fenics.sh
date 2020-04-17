# GNU compilers
FENICS_TOOLCHAIN="gcc"
# module load swenv/default-env
# module load devel/CMake/3.13.3-GCCcore-8.2.0
# module load toolchain/iimpi/2019a 
# module load lang/flex/2.6.4-GCCcore-8.2.0 
# module load lang/Python/3.7.2-GCCcore-8.2.0
# module load data/HDF5/1.10.5-iimpi-2019a
# module load devel/Boost/1.70.0-iimpi-2019a
# module load numlib/imkl/2019.1.144-iimpi-2019a

export CC=gcc
export CXX=g++
export FC=gfortran
export MPICC=mpicc
export MPICXX=mpicxx
export MPIFC=mpif90

# PREFIX is where the root of the install will be. $WORK or $HOME are good
# choices, or $STORE if your happy only to run FEniCS on gaia-80.  BUILD_DIR is
# where everything will be built. If you build on gaia-80, $STORE is a good
# choice.  Make sure you have created your /store directory at
# /store/rues/your-username on gaia-80 and set the variable $STORE in your
# .profile.

FENICS_PYTHON=python3.5

TAG=2019.1.0.r1
PREFIX=${HOME}/apps/fenics-${TAG}
WORKON_HOME=${PREFIX}/virtualenv
#BUILD_DIR=/tmp/${USER}/fenics-${TAG}
BUILD_DIR=${PREFIX}/build
BUILD_THREADS=1

export PATH=${PREFIX}/bin:${PATH}
export LD_LIBRARY_PATH=${PREFIX}/lib:${PREFIX}/lib64:${LD_LIBRARY_PATH}
export C_INCLUDE_PATH=${PREFIX}/include:${C_INCLUDE_PATH}
export CPLUS_INCLUDE_PATH=${PREFIX}/include:${CPLUS_INCLUDE_PATH}
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig:${PREFIX}/lib64/pkgconfig:$PKG_CONFIG_PATH

FENICS_PYTHON_VERSION=$(${FENICS_PYTHON} -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))')
FENICS_PYTHON_MAJOR_VERSION=$(${FENICS_PYTHON} -c 'import sys; print(str(sys.version_info[0]))')
FENICS_PYTHON_MINOR_VERSION=$(${FENICS_PYTHON} -c 'import sys; print(str(sys.version_info[1]))')
