#' str_is
#' 
#' test if strings are certian cases
#' 
#' @param string vector. This must be an atomic vector, and will be coerced to 
#' a character vector 
#' 
#' @param ... one or more functions to apply to the string
#' 
#' @details
#'   
#'  \code{str_is} ... 
#'   
#' @return a character vector
#' 
#' @seealso 
#'   \code{\link{make_str_replace}}
#'   \code{\link{make_str_delete}}
#' 
#' @examples 
#'   string = c( "catch-22", "finnegans wake" )
#'   str_is( string, str_lowercase )
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

str_transform <- function( string, ... ) { 
  
  for( fn in list(...) )
    string <- fn( string )
  
  return(string)
}
