#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N testing              
#$ -cwd                  
#$ -l h_rt=12:00:00  # Request a runtime
#$ -q gpu          # Submit the job to the gpu queue
#$ -pe gpu-a100 1  # Request NNODE A100 GPUs
#$ -l h_vmem=16G    # Request memory per core
#$ -l rl9=true     # Use rocky linux true

# Initialise the environment modules
. /etc/profile.d/modules.sh
source /exports/applications/support/set_qlogin_environment.sh

# Setting up the environment
source /home/s2569758/miniconda3/bin/activate base

# Load Python
module load python/3.11.4
module load cuda
# pip install -r requirements.txt

# Run the program
#python train_evaluate_emnist_classification_system.py --filepath_to_arguments_json_file experiment_configs/cifar100_tutorial_config.json
python script/run.py -c config/transductive/inference.yaml --dataset FB15k237 --epochs 1000 --bpe null --gpus [0] --ckpt null
