#' str_cap_words
#'
#' Function used to convert character vectors to CapWord format. 
#' 
#' @param string character vector  to turn into a CapWords
# @param acronyms character; tokens to capitalize
#' 
#' CapWords is distinguished by: 
#' - All words with upper case first character 
#' - No non-word letters or numbers 
#'   
#' @examples
#'  str_cap_words( "One Flew Over The Cuckoo's Nest" )
#'  str_cap_words( "Catch-22" )  # catch_22
#'  
#' @rdname CapWords
#' @aliases str_cap_words
#' @export

str_cap_words <- function(string) { #
  
  if( ! is.character(string) ) stop( as.character(sys.call())[-1], ' is not character' )
  
  string <- str_ucfirst( string )
  string <- gsub( '[^\\w]', '', string, perl=TRUE )
  
  return(string)
  
}
