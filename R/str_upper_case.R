#' str_uppercase, str_lowercases
#' 
#' convert string to upper or lower case
#' 
#' @param string argument passed to \code{toupper}
#' 
#' @examples
#'  str_upper_case( "one flew over the cuckoo's nest" )
#'  str_upper_case( "catch-22" )  
#' 
#' @rdname str_upper_case
#' @aliases upper_case
#' @export

str_upper_case <- function(string) {
  if( ! is.character(string) ) stop( as.character(sys.call())[-1], ' is not character' ) 
  toupper(string)
}
