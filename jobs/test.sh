#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N hello              
#$ -wd home/s2569758/ImproveLPwithLLMs
#$ -o /home/s2569758/ImproveLPwithLLMs/outputs/
#$ -e /home/s2569758/ImproveLPwithLLMs/errors/
#$ -l h_rt=12:00:00  # Request a runtime
#$ -q gpu          # Submit the job to the gpu queue
#$ -pe gpu-a100 1  # Request NNODE A100 GPUs
#$ -l h_vmem=16G    # Request memory per core
#$ -l rl9=true     # Use rocky linux true
#  These options are:
#  job name: Test
#  use the current working directory: -cwd
#  runtime limit of 5 minutes: -l h_rt
#  memory limit of 1 Gbyte: -l h_vmem
# Initialise the environment modules
. /etc/profile.d/modules.sh

# Setting up the environment
source /home/s2569758/miniconda3/bin/activate base

# Load Python
module load python/3.11.4
module load cuda/12.1.1

# Run the program
python script/run.py -c config/transductive/inference.yaml --dataset FB15k237 --epochs 500 --bpe null --gpus [0] --ckpt null
