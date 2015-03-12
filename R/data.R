#' Begin and end dates for the PubMed files
#'
#' A data.frame of the first and last year for which some publication from that
#' year appears in each of the 684 PubMed data files.
#'
#' @format A data.frame with columns `begin` and `end`.
#' @source Xintao Wei
#' @name file.rans
NULL

#' 2014 Medical Subject Headings tree
#'
#' A data.table of 2014 MeSH terms and their hierarchical tree numbers. This 
#' object is adapted from the source file `mtrees2014.bin` using the script
#' `mtrees.R`.
#'
#' @format A data.table with first column the MeSH terms and second column the
#' corresponding hierarchical tree numbers.
#' @source National Library of Medicine
#' \url{http://www.nlm.nih.gov/mesh/filelist.html}
#' @name mtrees
NULL

#' PubMed and NCBI Molecular Biology Database Journals
#' 
#' A data.table of PubMed and NCBI Journal identifiers with full and abbreviated
#' journal titles and print and online ISSN numbers.
#'
#' A data.table of 2014 MeSH terms and their hierarchical tree numbers. This 
#' object is adapted from the source file `mtrees2014.bin` using the script
#' `mtrees.R`.
#'
#' @format A data.table.
#' @source National Library of Medicine
#' \url{http://www.ncbi.nlm.nih.gov/books/NBK3827/table/pubmedhelp.pubmedhelptable45/}
#' @name jids
NULL
