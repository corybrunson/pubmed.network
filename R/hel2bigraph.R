#' Create a bigraph from a hyperedge list
#' 
#' This function constructs a bipartite graph from a hyperedge list given as a
#' data.table.
#' @param hel data.table with first column one type of node and second column a
#' list of nodes of the other type tied to the corresponding node in the first.
#' @param type Logical; node type for the first column.
#' @export

hel2bigraph <- function(hel, type = FALSE) {
    # Trivial cases
    if(nrow(hel) == 0) return(graph.empty(n = 0))
    # "Melt" hyperedge list into edgelist
    el <- data.table(
        author = rep(hel$author, sapply(hel$papers, length)),
        papers = unlist(hel$papers)
    )
    # Construct bigraph
    bigraph <- graph.edgelist(as.matrix(el))
    # Assign type attribute according as name can be coerced to numeric
    V(bigraph)$type <- !is.na(as.numeric(V(bigraph)$name))
    # Permute vertices into order of type
    bigraph <- permute.vertices(bigraph, order(order(V(bigraph)$type)))
    # Remove any whitespace from the event names
    V(bigraph)$name[V(bigraph)$type] <-
        gsub(' ', '', V(bigraph)$name[V(bigraph)$type])
    bigraph
}
