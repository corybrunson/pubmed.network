% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/an.union.R
\name{an.union}
\alias{an.union}
\title{Union of affiliation networks}
\usage{
an.union(an1, an2, match.actors = TRUE, match.events = TRUE)
}
\arguments{
\item{an1}{Bipartite graph object}

\item{an2}{Bipartite graph object}

\item{match.actors}{Logical; whether to match actors with same names.
Defaults to `TRUE`}

\item{match.events}{Logical; similar to `match.actors`}
}
\description{
This function takes the union of two affiliation networks and the quotient of
this union by actors and/or events having the same names. If nodes of some
type are not matched, but any two nodes of this type in different networks
have the same name, then both networks' nodes of this type are prepended with
`X` (first network) and `Y` (second network).
}

