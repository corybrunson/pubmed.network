#' Split lines and keep only certain entries
#' 
#' This function splits a list or vector of lines by a pattern but includes only
#' certain entries in the output (all of which must be present in each split
#' string).
#' @param x Vector or list of strings (to be fed to `strsplit`)
#' @param pattern Character string
#' @param inds Numerical vector; entries of each `strsplit` to keep
#' @export

subsplit <- function(x, pattern, inds = 1, cl, parallel = !missing(cl)) {
    if(parallel) {
        stopifnot(require(snow))
        stopifnot(require(parallel))
        if(missing(cl)) cl <- makeCluster(rep('localhost', detectCores()[[1]]))
        parLapply(cl, strsplit(x, pattern), function(vec) vec[inds])
    }
    lapply(strsplit(x, pattern), function(vec) vec[inds])
}
