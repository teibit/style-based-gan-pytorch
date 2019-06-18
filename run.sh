#!/bin/bash
#SBATCH -J EVER
#SBATCH -p high
#SBATCH -N 1
#SBATCH --mem=128GB

# SBATCH --exclude=node025
# SBATCH --nodelist node031

#SBATCH --workdir=/homedtic/gulloa/EVER/project
#SBATCH --gres=gpu:1
# SBATCH --sockets-per-node=1
# SBATCH --cores-per-socket=2
# SBATCH --threads-per-core=2


#SBATCH -o slurm.%N.%J.%u.out # STDOUT
#SBATCH -e slurm.%N.%J.%u.err # STDERR

module load Python/3.6.4-foss-2017a

module load  CUDA/9.1.85

module load torchvision/0.2.1-foss-2017a-Python-3.6.4
module load PyTorch/1.0.0-foss-2017a-Python-3.6.4-CUDA-9.0.176

module load numpy/1.14.0-foss-2017a-Python-3.6.4

python /homedtic/gulloa/EVER/project/train.py --mixing -d folder /homedtic/gulloa/EVER/project/data
