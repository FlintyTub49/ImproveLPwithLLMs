#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N hello              
#$ -cwd                  
#$ -l h_rt=00:05:00 
#$ -l h_vmem=1G
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
python train_evaluate_emnist_classification_system.py --filepath_to_arguments_json_file experiment_configs/cifar100_tutorial_config.json
