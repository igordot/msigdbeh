test_that("msigdbeh() human", {
  mdb <- msigdbeh(species = "HS")
  expect_s3_class(mdb, "data.frame")
  expect_identical(names(mdb)[1:6], c("db_gene_symbol", "db_ncbi_gene", "db_ensembl_gene", "source_gene", "gs_id", "gs_name"))
  expect_equal(length(unique(mdb$db_version)), 1)
  expect_identical(unique(mdb$db_target_species), "HS")
  # Overall dimensions
  expect_gt(nrow(mdb), 4000000)
  expect_gt(length(unique(mdb$gs_id)), 34000)
  expect_gt(length(unique(mdb$db_gene_symbol)), 40000)
  expect_gt(length(unique(mdb$db_ncbi_gene)), 40000)
  expect_gt(length(unique(mdb$db_ensembl_gene)), 40000)
  # Gene set sizes
  expect_equal(min(table(mdb$gs_id)), 5)
  expect_lt(max(table(mdb$gs_id)), 3000)
  expect_gt(quantile(table(mdb$gs_id), 0.9), 200)
  expect_gt(quantile(table(mdb$gs_id), 0.5), 20)
})

test_that("msigdbeh() mouse", {
  mdb <- msigdbeh(species = "MM")
  expect_s3_class(mdb, "data.frame")
  expect_identical(names(mdb)[1:6], c("db_gene_symbol", "db_ncbi_gene", "db_ensembl_gene", "source_gene", "gs_id", "gs_name"))
  expect_equal(length(unique(mdb$db_version)), 1)
  expect_identical(unique(mdb$db_target_species), "MM")
  # Overall dimensions
  expect_gt(nrow(mdb), 1500000)
  expect_gt(length(unique(mdb$gs_id)), 16000)
  expect_gt(length(unique(mdb$db_gene_symbol)), 40000)
  expect_gt(length(unique(mdb$db_ncbi_gene)), 40000)
  expect_gt(length(unique(mdb$db_ensembl_gene)), 40000)
  # Gene set sizes
  expect_equal(min(table(mdb$gs_id)), 5)
  expect_lt(max(table(mdb$gs_id)), 3000)
  expect_gt(quantile(table(mdb$gs_id), 0.9), 200)
  expect_gt(quantile(table(mdb$gs_id), 0.5), 20)
})

test_that("msigdbeh() species variants", {
  expect_identical(msigdbeh(species = "HS"), msigdbeh(species = "Hs"))
  expect_identical(msigdbeh(species = "MM"), msigdbeh(species = "Mm"))
})
