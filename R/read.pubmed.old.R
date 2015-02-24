#' Read PubMed data to a data frame
#' 
#' This function reads PubMed data to a data frame.
#' @param file Character string; the name of the data file
#' @param nrows Numeric; the number of rows to read
#' @param skip Numeric; the number of lines to skip
#' @export

# Read PubMed data as a table
read.pubmed.old <- function(file, nrows = -1, skip = 0, fileEncoding = '437')
{
    # Read the connection into a data frame
    dat <- read.table(file = file, header = TRUE,
                     sep = ',', quote = '\"',
                     fill = TRUE, comment.char = '',
                     nrows = nrows, skip = skip,
                     row.names = NULL,
                     fileEncoding = fileEncoding,
                     colClasses = 'character')
    names(dat) <- names(read.csv(file, nrows = 1))
    dat
}
