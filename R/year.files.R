#' File numbers for a given year
#' 
#' This function identifies the numbers of the PubMed files containing entries
#' dated to a given year.
#' @param year Numeric; a year.
#' @export

year.files <- function(year)
{
    data(file.rans)
    which(file.rans$begin <= year & file.rans$end >= year)
}
