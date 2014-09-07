home_dir = "~/projects/nd_03_nicka_power/"
data_dir = str_c(home_dir, "data/")
setwd(home_dir)

# Read in the file
dat = read.table(str_c(data_dir, 'pad-cyto.tsv'), check.names=F, sep="\t", header=T)


cn = c('id', 'pheno', "IP-10", "FRACTALKINE", "FGF-2", "VEGF")
forout = dat[,cn]
forout = forout[1:70, ]
bad = which(forout$pheno == 'Chronic -')[11:length(which(forout$pheno == 'Chronic -'))]
forout = forout[-bad, ]
bad = c(which(forout$pheno == 'Control -')[11:16], which(forout$pheno == 'Control +')[11])
forout = forout[-bad, ]
sample_id = paste("Sample", 1:nrow(forout))
pheno = rep(paste("Group", 1:5), each = 10)
ff = cbind.data.frame(sample_id, pheno, log2(forout[ ,3:6]))

names(ff) = c('ID', 'Group', paste0('Gene', 1:4))

write.table(ff, file = '~/projects/intro-r/data/data_dl/gene-exprs-wide.tsv', sep = '\t', quote = F, row.names = F)
write.csv(ff, file = '~/projects/intro-r/data/data_dl/gene-exprs-wide.csv', row.names = F)

melted = melt(ff, id.vars = c('ID', 'Group'))
names(melted) = c('ID', 'Group', 'Gene', 'Expression')
write.table(melted, file = '~/projects/intro-r/data/data_dl/gene-exprs-long.tsv', sep = '\t', quote = F, row.names = F)
write.csv(melted, file = '~/projects/intro-r/data/data_dl/gene-exprs-long.csv', row.names = F)
