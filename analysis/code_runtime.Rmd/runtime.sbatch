#!/bin/bash

# Submit batch job running runtime.R

#SBATCH --time=36:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=joycehsiao@uchicago.edu
#SBATCH --partition=broadwl
#SBATCH --account=pi-mstephens
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=5GB

set -e

n_gene=$1
n_clust=$2
tol=$3

module unload R
module load R/3.5.1

Rscript runtime.R ${n_gene} ${n_clust} ${tol}
