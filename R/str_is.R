#' Test whether strings are of the specified type 
#' 
#' Family of functions for testing whether strings are of the specified type.
#' 
#' @param string vector. This must be an atomic vector, and will be coerced to 
#' a character vector 
#' 
#' @param type function that transforms the string to type
#' 
#' @param autostart integer; number of elements to test before concluding that 
#'   \code{string} is of the suggested \code{type}. (Default: 30)
#' 
#' @details
#'   
#'  \code{str_is} determines if the string belongs to one of the supported
#'  lettercase types. Comparisons are made by comparing the original string 
#'  to a transformed version of the string. If the two are identical, then 
#'  the functions are equivalent. 
#'  
#'  \code{autostart} determines the maximum number of values 
#'   
#' @return logical vector indicating which entries of \code{string} are of the 
#' specified \code{type}
#' 
#' @seealso 
#'   \code{\link{str_transform}} \cr
#'   \code{\link{make_str_replace}} \cr
#'   \code{\link{make_str_delete}} \cr
#' 
#' @examples 
#'   string = c( "catch-22", "finnegans wake" )
#'   str_is( string, str_lower_case )
#'   
#'   str_transform( string, str_capitalize, str_delete_nonword )
#'   str_delete_nonword( str_capitalize( string ) )      # SAME
#'   
#'   \dontrun{
#'     # magrittr:
#'     sting %>% str_capitalize %>% str_delete_nonword   # SAME
#'   }
#'   
#' @export
  str_is <- function( string, type, autostart=30L ) { 
    autostart <- min( length(string), autostart ) 
    string[ 1:autostart ] == type( string[ 1:autostart ] )
  }


#' @rdname str_is
#' @export
  str_is_all <- function( ... ) all( str_is(...) ) 


#' @rdname str_is
# not exported
  make_str_is <- function( type ) 
    function(string) str_is( string, type )

#' @rdname str_is
# not exported 
  make_str_are <- function( type ) 
    function( string ) str_is_all( string, type )


# UPPERCASE 
# ---------------------------------

#' @rdname str_is
#' @export
  str_are_uppercase <- make_str_are( str_uppercase )


#' @rdname str_is
#' @export
  str_are_upper_case <- str_are_uppercase


# LOWERCASE 
# ---------------------------------
#' @rdname str_is
#' @export
  str_are_uppercase <- make_str_are( str_uppercase )


#' @rdname str_is
#' @export
  str_are_upper_case <- str_are_uppercase
