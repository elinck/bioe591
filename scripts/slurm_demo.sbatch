#!/bin/bash
##
## snparcher.slurm.sh: submit snpArcher workflow via SLURM
##
## Lines starting with #SBATCH are read by SLURM. Lines starting with ## are comments.
## All other lines are read by the shell.
##

#SBATCH --account=priority-ethanlinck        # specify the account to use
#SBATCH --job-name=slurm_demo                # job name
#SBATCH --partition=priority                 # queue partition to run the job in
#SBATCH --nodes=1                            # number of nodes to allocate
#SBATCH --ntasks-per-node=1                  # number of tasks (keep at 1 for Snakemake DAG manager)
#SBATCH --cpus-per-task=4                    # cores for Snakemake DAG manager
#SBATCH --mem=4G                             # memory for DAG manager
#SBATCH --time=00:01:00                      # maximum job run time
#SBATCH --output=slurm_demo-%j.out           # stdout log
#SBATCH --error=slurm_demo-%j.err            # stderr log
#SBATCH --mail-user=ethan.linck@montana.edu
#SBATCH --mail-type=ALL

module load Mamba/23.11.0-0
echo "Running on $SLURM_CPUS_PER_TASK CPUs"
python hello.py
