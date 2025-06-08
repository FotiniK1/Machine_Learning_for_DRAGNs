#!/bin/bash

#SBATCH -t 40
#SBATCH --mem=1024
#SBATCH --tmp=4096MB
#SBATCH -n 2
#SBATCH --job-name GPz_Class
#SBATCH --mail-type=ALL
#SBATCH --mail-user=fotini.kouloukis@students.mq.edu.au
#SBATCH --output slurm_logs/gpz_class_%A_%a.out
#SBATCH --error slurm_logs/gpz_class_%A_%a.err
#SBATCH --array=0-99

source /fred/oz237/fkoulouk/Project/Slurm/hpc_profile_setup.sh

mkdir seed_${SLURM_ARRAY_TASK_ID}
cd seed_${SLURM_ARRAY_TASK_ID}

singularity exec $container_path/GPz_Python.simg python3 $script_path/GPz_GMM_HPC_Class.py -s ${SLURM_ARRAY_TASK_ID}
