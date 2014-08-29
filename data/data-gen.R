#!/usr/bin/env Rscript
# andrew borgman
# varibbc
# script to create some dummy data for students to read into r
library(ggplot2)
library(dplyr)
library(tidyr)

set.seed(030289)

# build up an experimental data set
reps = 15
dat = data.frame(
  id = 1:reps, 
  treatment = rep(c("Control", "Treat 1", "Treat 2", "Combination"), each = reps),
  vals = c(
    rnorm(reps, mean = 10, sd = 1),
    rnorm(reps, mean = 8, sd = 1),
    rnorm(reps, mean = 6, sd = 1),
    rnorm(reps, mean = 4, sd = 1)    
  )
)

ggplot(dat, aes(x = treatment, y = vals)) + geom_point(position = "jitter")

wide = dat %>% spread(id, vals)

write.table(dat, 'test_data_long.tsv', sep = "\t", col.names = T, row.names = F, quote = F)
write.csv(dat, 'test_data_long.csv', row.names = F)
write.table(dat, 'test_data_long.txt', col.names = T, row.names = F, quote = F)

write.table(wide, 'test_data_wide.tsv', sep = "\t", col.names = T, row.names = F, quote = F)
write.csv(wide, 'test_data_wide.csv', row.names = F)
write.table(wide, 'test_data_wide.txt', col.names = T, row.names = F, quote = F)

