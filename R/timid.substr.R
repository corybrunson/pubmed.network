#' Substring up to the first instance of a character
#' 
#' This function uses `substr` to extract the starting characters of a string up
#' to either the first instance of a given stop character or the first
#' unreadable character.
#' @param x a character string
#' @param up.to a regular expression
#' @export

timid.substr <- function(x, up.to) {
    stopifnot(length(x) == 1)
    t <- 0
    ss <- try(substr(x, 1, t))
    while(class(ss) != 'try-error') {
        s <- ss
        t <- t + 1
        ss <- try(substr(x, 1, t))
        if(grepl(up.to, ss)) break
    }
    return(unname(s))
}
