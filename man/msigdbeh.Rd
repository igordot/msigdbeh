% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/msigdbeh.R
\name{msigdbeh}
\alias{msigdbeh}
\title{Retrieve MSigDB gene sets stored in ExperimentHub}
\usage{
msigdbeh(species = c("HS", "MM"))
}
\arguments{
\item{species}{Species abbreviation for human or mouse databases (\code{"HS"} or \code{"MM"}).}
}
\value{
A data frame of gene sets with one gene per row.
}
\description{
Retrieve a data frame of MSigDB gene sets and their member genes.
MSigDB is split into human and mouse resources, each one provided in the approved gene symbols of its respective species.
}
\examples{
mdf <- msigdbeh(species = "HS")
head(mdf)
}
\references{
Subramanian A, Tamayo P, Mootha VK, Mukherjee S, Ebert BL, Gillette MA, Paulovich A, Pomeroy SL, Golub TR, Lander ES, Mesirov JP. Gene set enrichment analysis: a knowledge-based approach for interpreting genome-wide expression profiles. \emph{Proc Natl Acad Sci}. 2005 Oct 25;102(43):15545-50. \doi{10.1073/pnas.0506580102}

Liberzon A, Birger C, Thorvaldsdóttir H, Ghandi M, Mesirov JP, Tamayo P. The Molecular Signatures Database (MSigDB) hallmark gene set collection. \emph{Cell Syst}. 2015 Dec 23;1(6):417-425. \doi{10.1016/j.cels.2015.12.004}

Castanza AS, Recla JM, Eby D, Thorvaldsdóttir H, Bult CJ, Mesirov JP. Extending support for mouse data in the Molecular Signatures Database (MSigDB). \emph{Nat Methods}. 2023 Nov;20(11):1619-1620. \doi{10.1038/s41592-023-02014-7}
}
