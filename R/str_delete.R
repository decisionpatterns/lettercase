#' str_delete
#' 
#' Delete or remove characters from a string based on patterns
#' 
#' @param string atomic character vector 
#' 
#' @param ... atomic patterns
#' 
#' 
#' @examples
#'   
#'   str_delete( "ABC & 123", "\\W" )  # ABC123
#' 
#' @export 

str_delete <- function( string, ... ) { 

  for( pattern in list(...) ) {
    # stingr: ?
    pattern <- stringr:::check_pattern( pattern, string ) 
    string <- stringr:::re_call( 'gsub', string, pattern, replacement='' )
    # gsub( pattern, '', string, perl=TRUE )
  }
  
  return(string)    

}
