#' str_ucfirst
#' 
#' Convert first character of a string to uppercase
#' 
#' @param x character vector to be 
#' 
#' @export

str_ucfirst <- function(string)
  gsub( "\\b([a-z])([a-z]+)", "\\U\\1\\L\\2", string, perl=TRUE ) # ucfirst
