#' Collect MeSH terms at or below a given set of parents
#' 
#' This function takes a vector of parent MeSH terms and returns a vector of
#' parent and children MeSH terms.
#' @param vec Character vector; parent MeSH terms whose children to include
#' @export

# Read PubMed data as a table
mesh.family <- function(vec)
{
    data(mtrees)
    fam <- sapply(vec, function(mh) {
        code.vec <- mtrees$code[which(mtrees$term %in% vec)]
        sapply(code.vec, function(co) {
            mtrees$term[grep(paste0('^', co), mtrees$code)]
        })
    })
    unique(as.vector(unlist(fam)))
}
