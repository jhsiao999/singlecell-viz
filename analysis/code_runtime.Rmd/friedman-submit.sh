# identify top cylcial in each training set and compute prediction error in each fold

for nclust in $(seq 2 20); do
  sbatch friedman.sbatch $nclust 1
done
