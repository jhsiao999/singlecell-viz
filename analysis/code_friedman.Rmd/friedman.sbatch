#!/bin/bash

# Submit batch job running runtime.R

#SBATCH --time=36:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=joycehsiao@uchicago.edu
#SBATCH --partition=broadwl
#SBATCH --account=pi-mstephens
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5
#SBATCH --mem-per-cpu=6GB

set -e

n_gene=$1
n_clust=$1
tol=$2

module unload R
module load R/3.5.1

Rscript friedman.R ${n_clust} ${tol}
