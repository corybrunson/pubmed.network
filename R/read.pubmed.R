#' Read PubMed data to a data frame
#' 
#' This function reads PubMed data to a data frame.
#' @param file Character string; the name of the data file
#' @param nrows Numeric; the number of rows to read
#' @param skip Numeric; the number of lines to skip
#' @param fileEncoding Character string; the file encoding of `file`
#' @param mh Character vector; MeSH headings required
#' @export

# Read PubMed data as a table
read.pubmed <- function(file, nrows = -1, skip = 0, fileEncoding = '437')
{
    lines <- readLines(file)
    # Regular expressions used in the conversion process
    res <- c(
        fau = paste(
            c('(^[0-9]+,".*)"(.*"', ',".*"', rep(',"[^"]*"', 12), '$)'),
            collapse = ''
        ),
        au = paste(
            c('(^[0-9]+,"[^"]*",".*)"(.*"', rep(',"[^"]*"', 12), '$)'),
            collapse = ''
        ),
        ad = paste(
            c('(^[0-9]+', rep(',"[^"]*"', 11), ',".*)"(.*"',
              rep(',"[^"]*"', 2), '$)'),
            collapse = ''
        )
    )
    # Replace double quotes with single quotes within each field
    for(re in res) {
        wh <- grep(re, lines, useBytes = TRUE)
        while(length(wh) > 0) {
            lines[wh] <- gsub(re, '\\1\'\\2', lines[wh], useBytes = TRUE)
            wh <- grep(re, lines, useBytes = TRUE)
        }
    }
    # Write lines to a temp file
    con <- file('data/medline/temp.txt')
    writeLines(lines, con)
    close(con)
    # Read the temp file into a data frame
    dat <- read.table(file = 'data/medline/temp.txt', header = TRUE,
                      sep = ',', quote = '\"',
                      fill = TRUE, comment.char = '',
                      nrows = nrows, skip = skip,
                      row.names = NULL,
                      fileEncoding = fileEncoding,
                      colClasses = 'character')
    names(dat) <- names(read.csv(file, nrows = 1))
    as.data.table(dat)
}
