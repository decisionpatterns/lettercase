#' str_is
#' 
#' test if strings are certian cases
#' 
#' @param string vector. This must be an atomic vector, and will be coerced to 
#' a character vector 
#' 
#' @param type function that transforms the string to type.
#' 
#' @details
#'   
#'  \code{str_is} determines if the string belongs to one or more of the 
#'  lettercase types. Comparisons are made by comparing the original string 
#'  to a transformed version of the string.  If the two are identical, then 
#'  the functions are equivalent. 
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

str_is <- function( string, type ) { 
  
  string == type( string )
}
