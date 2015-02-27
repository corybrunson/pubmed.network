# Generate a file of begin and end dates for each PubMed data file

# set working directory
if(file.exists('~/Documents')) setwd('~/Documents/CQM/')
setwd('PubMed/')

# File with date and size info for each file
info.file <- 'data/medline/medLineFileInfo.csv'
# Read into a data.frame
file.info <- read.csv(info.file,
                      nrows = countLines(info.file) - 3)
# Construct a two-column data.frame with begin and end years for each file
file.rans <- data.frame(
    begin = as.numeric(as.character(
        gsub('-[0-9]{4}$', '', file.info$Publication.Years)
    )),
    end = as.numeric(as.character(
        gsub('^[0-9]{4}-', '', file.info$Publication.Years)
    ))
)
# Save this data.frame as a data object for `pubmed.network`
save(file.rans, file = 'pkg/pubmed.network/data/file.rans.rda')
