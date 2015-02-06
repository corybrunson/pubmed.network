pubmed.network
=======

This R package contains functions for network analysis of PubMed data.

## Description

An ongoing network analysis of an excerpt of the [PubMed bibliographic database] [2] makes use of the [Author-ity database] [1] to disambiguate author names. The data consolidation consists in omitting

* PMIDs (PubMed publication identification numbers) from the PubMed excerpt that do not appear, or do not appear as many times as they should (once for each author), in Author-ity; and
* PMIDs from Author-ity that do not appear in the PubMed excerpt.

Further steps will be discussed as they are performed.

[1]: http://arrowsmith.psych.uic.edu/arrowsmith_uic/author2.html
[2]: http://www.ncbi.nlm.nih.gov/pubmed/

## Install

The repo is arranged as an R package and can be installed using the [devtools](http://cran.r-project.org/web/packages/devtools/index.html) package:

```r
if(!require(devtools)) {
    install.packages('devtools')
    stopifnot(require(devtools))
}
install_github('corybrunson/pubmed.network')
```

If you experience any problems with the installation process (that aren't resolved by `?` and searching, e.g., [StackExchange] [3], please let me know.

[3]: http://stackexchange.com/

## References

The Author-ity database is credited to:

* Torvik VI, Smalheiser NR. "Author name disambiguation in MEDLINE." ACM Transactions on Knowledge Discovery from Data 2009; **3**(3):11.
* Smalheiser NR, Torvik VI. "Author name disambiguation." In *Annual Review of Information Science and Technology* (B. Cronin, Ed.), Vol. 43 (2009), pp. 287-313.
