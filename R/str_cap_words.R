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
#' # CAP WORDS 
#'  str_cap_words( "One Flew Over The Cuckoo's Nest" )
#'  str_cap_words( "Catch-22" )  # CATCH
#'  
#' @rdname CapWords
#' @aliases str_cap_words cap_words
#' @export

str_cap_words <- function(string) { #
  
  if( ! is.character(string) ) stop( deparse(substitute(x)), ' is not character' )
  
  string <- str_ucfirst( string )
  string <- gsub( '[^\\w]', '', string, perl=TRUE )
  
  return(string)
  
}


#' @rdname str_cap_words
#' @examples
#'    is_cap_words( "AbcDef" )  # TRUE 
#'    is_cap_words( "Abc" )     # TRUE 
#'    
#'    is_cap_words( "abcdef" )  # FALSE 
#'    is_cap_words( "123Abc" )  # FALSE
#'    is_cap_words( "_Abc" )    # FALSE
#'    is_cap_words( "Abc_Def" ) # FALSE 
#'    is_cap_words( "Abc$Def" ) # FALSE 
#'    
#' @export 
is_cap_words <- function( string ) 
  ! ( 
    grepl( '^[^A-Z]', string, perl=TRUE ) |    # initial non-cap
    grepl( '[_\\W]' , string, perl=TRUE )      # non-word or underscore 
  )