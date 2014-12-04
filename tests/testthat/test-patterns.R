library(testthat)
library(stringr)

context(patterns)
  whitespace <- c( " ", "  ", "\t", "\t\t")
  for( ws in whitespace ) expect_true( grepl( pattern_whitespace, ws ) )

  whitespace_like <- c( "-", "_", )