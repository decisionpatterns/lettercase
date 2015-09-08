

#' @import stringr
NULL


# collapse
collapse <- function(x,collapse='') paste(x,collapse = collapse)

# qw 
qw <- function (...) as.character(match.call())[-1]