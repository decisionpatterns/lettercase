#' str_snake_case
#'
#' Function used to convert character vectors to snake case format. 
#' 
#' @param string object to turn into a title case
# @param acronyms character; tokens to capitalize
#' 
#' * characters are all lower case 
#' * non- \code{\\w}, \code{\\s} and - are dropped
#' * \code{\\w} and - are converted to underscore
#' * no support for acronyms
#' 
#' @examples
#'  str_snake_case( "One Flew Over The Cuckoo's Nest" )
#'  str_snake_case( "Catch-22" )  # catch_22
#'  
#' @rdname SnakeCase
#' @aliases str_snake_case
#' @export

str_snake_case <- function(string) { #
  
  if( ! is.character(string) ) stop( as.character(sys.call())[-1], ' is not character' )
  
  # for( ac in acronyms )  string <- gsub( tolower(ac), ac, string )
  
  string <- gsub( '[^\\w\\s-]', '', string, perl=TRUE )
  string <- tolower(string)
  string <- gsub( '[\\s-]+', '_', string, perl=TRUE )
  
  return(string)
  
}
