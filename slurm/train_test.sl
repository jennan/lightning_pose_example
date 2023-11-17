#!/usr/bin/env bash
#SBATCH --time=00-00:30:00
#SBATCH --partition hgx,gpu
#SBATCH --cpus-per-task=4
#SBATCH --mem=10GB
#SBATCH --gpus-per-node=A100:1
#SBATCH --output logs/%j-%x.out
#SBATCH --error logs/%j-%x.out

# activate Python virtual environment
module purge && module load Python/3.11.3-gimkl-2022a

# run the training script
venv/bin/python3 src/train_hydra.py
