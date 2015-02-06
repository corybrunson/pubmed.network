#' Read PubMed data to a data frame
#' 
#' This function reads PubMed data to a data frame.
#' @param file Character string; the name of the data file
#' @param nrows Numeric; the number of rows to read
#' @param skip Numeric; the number of lines to skip
#' @export

# Read PubMed data as a table
read.pubmed <- function(file, nrows = -1, skip = 0)
{
    # Read the connection into a data frame
    df <- read.csv(file = file, header = TRUE, nrows = nrows, skip = skip,
                   row.names = NULL,
                   fileEncoding = '437',
                   colClasses = c(rep('character', 3),
                                  rep('factor', 2),
                                  rep('character', 2),
                                  'factor',
                                  'character',
                                  'factor',
                                  rep('character', 4),
                                  'factor'))
    names(df) <- names(read.csv(file, nrows = 1))
    df
}
