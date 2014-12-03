#' @title constants used in lettercase package
#' 
#' @description These are constants that are used in the lettercase package.
#' 
#' @details 
#'   \code{lettercase} provides a number of constants for development purposes.
#'   These are not exported.
#'   
#' @rdname constants
#' @include make_str_replace.R
  pattern_whitespace <- '\\s'

#' @rdname constants
  pattern_connectors <- '[\\s_.-]'

#' @rdname constants 
  pattern_ucfirst <- '\\b([a-z])'

#' @rdname constants
  pattern_word       <- '\\w'

#' @rdname constants
  pattern_nonword    <- '\\W'

#' @rdname constants
  pattern_uppercase <- '[A-Z]'
