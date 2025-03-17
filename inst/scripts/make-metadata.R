# Load packages
library(dplyr)

# Create a data frame with all the required columns
blank_df <-
  data.frame(
    "Title" = character(),
    "Description" = character(),
    "BiocVersion" = character(),
    "Genome" = character(),
    "SourceType" = character(),
    "SourceUrl" = character(),
    "SourceVersion" = character(),
    "Species" = character(),
    "TaxonomyId" = character(),
    "Coordinate_1_based" = character(),
    "DataProvider" = character(),
    "Maintainer" = character(),
    "RDataClass" = character(),
    "DispatchClass" = character(),
    "Location_Prefix" = character(),
    "RDataPath" = character()
  )

# Add entries
md_df <-
  bind_rows(
    blank_df,
    data.frame(
      "Title" = "MSigDB v2024.1.Hs",
      "Description" = "Molecular Signatures Database Human Collections for release 2024.1",
      "SourceVersion" = "2024.1.Hs",
      "Species" = "Homo sapiens",
      "TaxonomyId" = "9606",
      "RDataPath" = "ndownloader/files/53008628"
    ),
    data.frame(
      "Title" = "MSigDB v2024.1.Mm",
      "Description" = "Molecular Signatures Database Mouse Collections for release 2024.1",
      "SourceVersion" = "2024.1.Mm",
      "Species" = "Mus musculus",
      "TaxonomyId" = "10090",
      "RDataPath" = "ndownloader/files/53008637"
    )
  )

# Set constant values
md_df$BiocVersion <- "3.20"
md_df$SourceType <- "Zip"
md_df$SourceUrl <- "https://data.broadinstitute.org/gsea-msigdb/msigdb/"
md_df$Maintainer <- "Bioconductor Package Maintainer <maintainer@bioconductor.org>"
md_df$RDataClass <- "data.frame"
md_df$DispatchClass <- "Rds"
md_df$Location_Prefix <- "https://figshare.com"

# Check
str(md_df)

# Save file
write.csv(md_df, file = "./inst/extdata/metadata.csv", row.names = FALSE)

# Make ExperimentHubMetadata objects from metadata.csv file
# ExperimentHubData::makeExperimentHubMetadata(pathToPackage = ".")
