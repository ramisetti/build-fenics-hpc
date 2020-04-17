# fenics-gaia-cluster #
### Scripts to build FEniCS on the University of Luxembourg gaia and iris clusters ###

Adapted the scripts from https://bitbucket.org/unilucompmech/fenics-gaia-cluster/src/master
The adapted version is used to compile FENICS with GNU compilers on a local HPC. 
The original Readme (see below) is kept unchanged.

These scripts will automatically build the latest stable version of
[FEniCS](http://fenicsproject.org) with PETSc, SLEPc and HDF5 support on the
University of Luxembourg gaia and iris Clusters.
 
To build  you need to have an account on and be familiar with using the
University of Luxembourg HPC first, see [HPC uni.lu](http://hpc.uni.lu)

## Compiling instructions ##

Conventions: `$` is a shell on the frontend, `$$` is a shell on a cluster
compute node.

First clone this repository.
```
#!shell
$ cd $HOME
$ git clone git@bitbucket.org:unilucompmech/fenics-gaia-cluster.git
$ cd $HOME
$ cd fenics-gaia-cluster
$ cd iris/ # or cd gaia/ if you are on gaia
$ ./builder
```

Run the following commands:
```
#!shell
$$ cd $HOME
$$ cd fenics-gaia-cluster
$$ ./build-all.sh | tee build.log
```
Wait for the build to finish. The output of the build will be stored in
build.log as well as outputted to the screen.

When you want to run FEniCS you must reserve resources on the cluster and then
setup your environment using:
```
#!shell
$$ source env-fenics.sh
```
before running any scripts.

### Advanced ###

You can adjust the build location and the installation location in the file
`env-build-fenics.sh` Also you can adjust the location of your Instant JIT
cache using the variables in the file `env-fenics.sh`.

## Running FEniCS MPI jobs ##

Included in this repository is a very simple example launcher script to submit
jobs on the cluster.

On gaia:
```
#!shell
$ cd $HOME
$ cd fenics-gaia-cluster/gaia
$ oarsub -S "fenics-launcher.sh python3 ../poisson.py"
```

On iris:
```
#!shell
$ cd $HOME
$ cd fenics-gaia-cluster/iris
$ sbatch fenics-launcher.sh python3 ../poisson.py
```

### Known issues ###

- Stalling downloads on gaia-cluster: Wait for the timeout to occur and the download should resume.
