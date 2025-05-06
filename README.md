# msigdbeh: MSigDB Data Frame via ExperimentHub

<!-- badges: start -->
[![R-CMD-check](https://github.com/igordot/msigdbeh/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/igordot/msigdbeh/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/igordot/msigdbeh/graph/badge.svg)](https://app.codecov.io/gh/igordot/msigdbeh)
<!-- badges: end -->

## Overview

The [Molecular Signatures Database (MSigDB)](https://www.gsea-msigdb.org/gsea/msigdb/) is a collection of gene sets originally created for use with the Gene Set Enrichment Analysis (GSEA) software.
The msigdbeh R package provides MSigDB gene sets in a "tidy" data frame.
Each row contains a gene (symbol, NCBI/Entrez ID, Ensembl ID) and the corresponding gene set.

The package provides documentation and a simple interface for accessing the relevant data files stored at the ExperimentHub web service.
It primarily serves as the data source for the [msigdbr](https://doi.org/10.32614/CRAN.package.msigdbr) package which adds ortholog predictions for frequently studied model organisms.
The data was originally part of msigdbr, but due to the growth of the underlying database, it has been moved to a separate package.

## Background

There are several resources that provide similar functionality:

* [msigdb](https://doi.org/doi:10.18129/B9.bioc.msigdb): Bioconductor package that provides data as GeneSet objects.
* [EGSEAdata](https://doi.org/doi:10.18129/B9.bioc.EGSEAdata): Bioconductor package that provides data as a list.
* [WEHI MSigDB](https://bioinf.wehi.edu.au/MSigDB/): Provides data for human and mouse as RDS files.
* [MSigDF](https://github.com/ToledoEM/msigdf): Provides data as an R data frame. Available only through GitHub.

Only MSigDF has been updated since 2023 (as of April 2025) and provides the latest version of MSigDB.
None of these alternatives include Ensembl IDs.

## Installation

The package can be installed from Bioconductor (after it is approved).

```r
BiocManager::install("msigdbeh")
```
