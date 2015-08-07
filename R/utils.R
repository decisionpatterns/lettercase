#' Pipe operator
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL


#' @import stringr
NULL



# collapse
collapse <- function(x,collapse='') paste(x,collapse = collapse)

# qw 
qw <- function (...) as.character(match.call())[-1]