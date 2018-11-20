# identify top cylcial in each training set and compute prediction error in each fold

for nclust in $(seq 2 20); do
  sbatch runtime.sbatch 100 $nclust 1
done
