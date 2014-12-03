#' @rdname str_upper_case
#' @aliases str_lower_case lower_case
#' @export

  str_lower_case <- function(string) {
    if( ! is.character(string) ) stop( deparse(substitute(string)), ' is not character' ) 
    tolower(string)
  }

#' @rdname str_upper_case
#' @aliases str_lowercase 
#' @export
  str_lowercase <- str_lower_case

#' @rdname str_upper_case 
#' @examples 
#' # is_lower_case 
#'   is_lower_case( 'ABC123' )      # FALSE
#'   is_lower_case( 'abc123' )      # TRUE 
#'   is_lower_case( 'aB'  )         # FALSE 
#'   is_lower_case( '123' )         # TRUE 

  is_lower_case <- function( string ) 
    ! grepl( "[A-Z]", string, perl=TRUE )
