#' Union of affiliation networks
#' 
#' This function takes the union of two affiliation networks and the quotient of
#' this union by actors and/or events having the same names. If nodes of some
#' type are not matched, but any two nodes of this type in different networks
#' have the same name, then both networks' nodes of this type are prepended with
#' `X` (first network) and `Y` (second network).
#' @param an1 Bipartite graph object
#' @param an2 Bipartite graph object
#' @param match.actors Logical; whether to match actors with same names.
#' Defaults to `TRUE`
#' @param match.events Logical; similar to `match.actors`
#' @export

an.union <- function(an1, an2, match.actors = TRUE, match.events = TRUE) {
    # Add actor/event indicators to names, so that no actor & event share a name
    a.pre <- if(match.actors) 'A' else 'XA'
    e.pre <- if(match.events) 'E' else 'XE'
    V(an1)$name[!V(an1)$type] <- paste0(a.pre, V(an1)$name[!V(an1)$type])
    V(an2)$name[!V(an2)$type] <- paste0(a.pre, V(an2)$name[!V(an2)$type])
    V(an1)$name[V(an1)$type] <- paste0(e.pre, V(an1)$name[V(an1)$type])
    V(an2)$name[V(an2)$type] <- paste0(e.pre, V(an2)$name[V(an2)$type])
    # Take the graph union
    an <- graph.union(an1, an2, byname = TRUE)
    # Remove the actor/event indicators
    V(an)$name[!V(an)$type] <- substring(V(an)$name[!V(an)$type], nchar(a.pre))
    V(an)$name[V(an)$type] <- substring(V(an)$name[V(an)$type], nchar(e.pre))
    # Return the graph union
    an
}
