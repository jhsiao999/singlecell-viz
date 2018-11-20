#!/usr/bin/env Rscript

# Description:
#   This script was written for extracting summary information
#  from the intensity values.

args <- commandArgs(trailingOnly = TRUE)

for (i in seq_along(args)) {
  cat(sprintf("Argument %d: %s", i, args[i]), sep = "\n")
}

n_gene <- as.numeric(args[1])
n_clust <- as.numeric(args[2])
tol <- as.numeric(args[3])

dir_input <- "/project2/gilad/joycehsiao/singlecell-viz/data/friedman2018"
dir_output <- "/project2/gilad/joycehsiao/singlecell-viz/output/runtime.Rmd"

all <- readRDS(file.path(dir_input,"counts.rds"))


library(matrixStats)
library(CountClust)

ii <- order(rowVars(as.matrix(all)), decreasing = T)[1:n_gene]
all_vars <- all[ii,]

tt <- system.time(res <- FitGoM(t(all_vars), K=n_clust,
                            path_rda=NULL,
                            tol=tol, control=list(verb=2)))
out <- list(fit=res,
            time=tt)

saveRDS(out, file = file.path(dir_output,
                              paste0("countclust_allsamples_","ngenes_",n_gene,
                                     "_nclust_", n_clust,".rds")))
