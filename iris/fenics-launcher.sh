#!/bin/bash -l
#SBATCH --time=0-00:03:00
#SBATCH --ntasks=8
#SBATCH --qos=qos-batch
source $HOME/fenics-gaia-cluster/env-fenics.sh
cd $SLURM_SUBMIT_DIR
srun --mpi=pmix -n $SLURM_NTASKS $@ 
