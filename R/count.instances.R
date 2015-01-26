#' Count instances of a string
#' 
#' This function counts the numbers of instances of a string in each of a vector
#' or list of strings.
#' @param x Vector or list of strings (to be fed to `strsplit`)
#' @param pattern Character string
#' @export

count.instances <- function(x, pattern) {
    if(mode(x) == 'list') x <- unlist(x)
    stopifnot(mode(x) == 'character')
    sapply(strsplit(paste0(x, pattern),
                    split = pattern, fixed = TRUE), length) - 1
}
