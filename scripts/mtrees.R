# Store MeSH tree as a hierarchical data.table
library(data.table)

# set working directory
if(file.exists('~/Documents')) setwd('~/Documents/CQM/')
setwd('PubMed/')
# load packages
pkgs <- c('pubmed.network', 'snow', 'parallel')
for(pkg in pkgs) {
    if(!require(pkg, character.only = TRUE)) {
        install.packages(pkg)
        library(pkg, character.only = TRUE)
    }
}

# Load as table with separator ';'
mtrees <- as.data.table(read.table('data/mtrees2014.bin', sep = ';', quote = '',
                                   colClasses = 'character'))
setnames(mtrees, c('V1', 'V2'), c('term', 'code'))

# Save now; don't bother saving the fragmented version below
save(mtrees, file = 'pkg/pubmed.network/data/mtrees.rda')

# Make sure each code begins at a letter
all(grepl('^[A-Z]', mtrees$code))
# Make sure periods lie at common positions
dots <- setdiff(unique(unlist(gregexpr('\\.', mtrees$code))), -1)
all(diff(dots) == 4)
# Peel top layer of hierarchy
mtrees[, h1 := substr(code, 1, 1)]
mtrees[, code := substr(code, 2, nchar(code))]
# Split remaining codes at dots
codes <- strsplit(mtrees$code, '\\.')
# Fill in missing levels with empty strings
max.l <- max(sapply(codes, length))
codes <- lapply(codes, function(vec) c(vec, rep('', max.l - length(vec))))
# Bind these to mtrees
mtrees <- cbind(mtrees, t(as.data.table(codes)))
# Remove original code
mtrees[, code := NULL]
setnames(mtrees, paste0('V', 1:12), paste0('h', 2:13))

rm(list = ls())
