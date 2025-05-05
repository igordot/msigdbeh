#' Retrieve MSigDB gene sets stored in ExperimentHub
#'
#' Retrieve a data frame of MSigDB gene sets and their member genes.
#' MSigDB is split into human and mouse resources, each one provided in the approved gene symbols of its respective species.
#'
#' @param species Species abbreviation for human or mouse databases (`"HS"` or `"MM"`).
#'
#' @return A data frame of gene sets with one gene per row.
#'
#' @references
#' Subramanian A, Tamayo P, Mootha VK, Mukherjee S, Ebert BL, Gillette MA, Paulovich A, Pomeroy SL, Golub TR, Lander ES, Mesirov JP. Gene set enrichment analysis: a knowledge-based approach for interpreting genome-wide expression profiles. *Proc Natl Acad Sci*. 2005 Oct 25;102(43):15545-50. \doi{10.1073/pnas.0506580102}
#'
#' Liberzon A, Birger C, Thorvaldsdóttir H, Ghandi M, Mesirov JP, Tamayo P. The Molecular Signatures Database (MSigDB) hallmark gene set collection. *Cell Syst*. 2015 Dec 23;1(6):417-425. \doi{10.1016/j.cels.2015.12.004}
#'
#' Castanza AS, Recla JM, Eby D, Thorvaldsdóttir H, Bult CJ, Mesirov JP. Extending support for mouse data in the Molecular Signatures Database (MSigDB). *Nat Methods*. 2023 Nov;20(11):1619-1620. \doi{10.1038/s41592-023-02014-7}
#'
#' @importFrom AnnotationHub mcols query subset
#'
#' @export
#'
#' @examples
#' mdf <- msigdbeh(species = "HS")
#' head(mdf)
msigdbeh <- function(species = c("HS", "MM")) {
    species <- toupper(species)
    species <- match.arg(species)

    # Create an ExperimentHub object
    hub <- ExperimentHub::ExperimentHub()

    # Get the data files associated with the msigdbeh package
    hubq <- AnnotationHub::query(hub, "msigdbeh")
    stopifnot(length(hubq) > 1)

    # Confirm that the data files are data frames
    hubq <- AnnotationHub::subset(hubq, hubq$rdataclass == "data.frame")
    stopifnot(length(hubq) > 1)

    # Select objects based on target species
    if (species == "HS") {
        hubq <- AnnotationHub::subset(hubq, hubq$species == "Homo sapiens")
    }
    if (species == "MM") {
        hubq <- AnnotationHub::subset(hubq, hubq$species == "Mus musculus")
    }

    # Get the metadata columns as data frame
    hubdf <- as.data.frame(AnnotationHub::mcols(hubq))
    stopifnot(nrow(hubdf) > 0)

    # Sort by date
    hubdf <- sort_by(hubdf, list(hubdf$rdatadateadded), decreasing = TRUE)

    # Return the most recent record
    return(hubq[[rownames(hubdf)[1]]])
}
