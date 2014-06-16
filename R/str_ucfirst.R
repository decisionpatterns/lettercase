#' str_ucfirst
#' 
#' Convert first character of a string to uppercase
#' 
#' @param string character vector to be converted.
#' 
#' @seealso 
#'   \code{\link{str_lowercase}}
#'   
#' @examples
#'  str_ucfirst( "ONE FLEW over the cuckoo's nest" )
#'  str_ucfirst( "catch-22" )  
#'  
#' @export

str_ucfirst <- function(string) {
  
  if( ! is.character(string) ) 
    stop( as.character(sys.call())[-1], ' is not character' )
  
  gsub( "\\b(\\w)(\\w+)", "\\U\\1\\L\\2", string, perl=TRUE ) # ucfirst

}
