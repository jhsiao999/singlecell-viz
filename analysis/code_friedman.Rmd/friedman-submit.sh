# identify top cylcial in each training set and compute prediction error in each fold

for nclust in $(seq 13 13); do
  sbatch friedman.sbatch $nclust 1
done
