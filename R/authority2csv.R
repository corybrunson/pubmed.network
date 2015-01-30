#' Convert Author-ity data to .csv
#' 
#' This function converts specified elements of Author-ity data (for main
#' results, not those using only 10 most recent papers) to a `.csv` file.
#' @param files Character vector; names of Author-ity files to include
#' @param file Character singleton; name of destination `.csv` file
#' @param no.lines Numeric; number of lines to read from `files` at a time
#' @praam wh.col Numeric; which columns of Author-ity to include in `file`
#' @param cl Cluster; optional
#' @export

authority2csv <- function(files, file, no.lines = 10000, wh.col = 1:25, cl) {
    for(f in files) {
        n <- 0
        N <- countLines(f)
        if(!missing(cl)) clusterExport(cl, 'N')
        while(N > n) {
            lines <- readLines(f, n = no.lines)
            n <- n + length(lines)
            if(!missing(cl)) clusterExport(cl, c('lines', 'n', 'wh.col'))
            mat <- do.call(rbind, if(!missing(cl)) {
                subsplit(lines, '\t', inds = wh.col, cl = cl)
            } else {
                subsplit(lines, '\t', inds = wh.col)
            })
            write.table(as.data.frame(mat), f = file, append = TRUE,
                        quote = FALSE, sep = ',',
                        row.names = FALSE, col.names = FALSE)
        }
    }
}
