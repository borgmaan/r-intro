#!/usr/bin/env Rscript
# andrew borgman
# varibbc
# script to create some dummy data for students to read into r


# build up an experimental data set
treatment = rep(c("Control", "Treat1", "Treat2", "Combination"), each = 12)
genotype = rep(c("WT/WT", "WT/KO", "KO/KO"), each = 4, length.out = length(treatment))
vals =
  
xx = expand.grid(treatment = c("Control", "Treat1", "Treat2", "Combination"), genotype = c("WT/WT", "WT/KO", "KO/KO"))
