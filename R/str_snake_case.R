#' str_snake_case
#'
#' Function used to convert character vectors to snake case format. 
#' 
#' @param x object to turn into a title case
# @param acronyms character; tokens to capitalize
#' 
#' * characters are all lower case 
#' * non- \w, \s and - are dropped
#' * \w and - are converted to underscore
#' * no support for acronyms
#' 
#' @examples
#'  str_snake_case( "One Flew Over The Cuckoo's Nest" )
#'  str_snake_case( "Catch-22" )  # catch_22
#'  
#' @rdname SnakeCase
#' @aliases str_snake_case

str_snake_case <- function(x) { #
  
  if( ! is.character(x) ) stop( as.character(sys.call())[-1], ' is not character' )
  
  # for( ac in acronyms )  x <- gsub( tolower(ac), ac, x )
  
  x <- gsub( '[^\\w\\s-]', '', x, perl=TRUE )
  x <- tolower(x)
  x <- gsub( '[\\s-]+', '_', x, perl=TRUE )
  
  return(x)
  
}
