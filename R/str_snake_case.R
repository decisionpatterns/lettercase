#' str_snake_case
#'
#' Function used to convert character vectors to snake case format. 
#' 
#' @param string object to turn into a title case
#' @param whitespace regular expression pattern to match for white-space
#' 
# @param acronyms character; tokens to capitalize
#' 
#' * characters are all lower case 
#' * non- \code{\\w}, \code{\\s} and - are dropped
#' * \code{\\w} and - are converted to underscore
#' * no support for acronyms
#' * multiple adjacent undescores are replaced by single underscore 
#' * Underscores at beginning or end of names are dropped  
#' 
#' @note The CamelCase conversion is adapted from an approach described on [Stack Overflow](https://stackoverflow.com/questions/1175208/elegant-python-function-to-convert-camelcase-to-snake-case/1176023#1176023).
#' 
#' @examples
#'   str_snake_case( "One Flew Over The Cuckoo's Nest" )
#'   str_snake_case( "Catch-22" )  # catch_22
#'   str_snake_case( "Catch.22" )
#'   str_snake_case( "Catch_22" )
#'   str_snake_case( "Catch  22" )
#'   str_snake_case( " Catch 22 " )
#'   
#'   str_snake_case( "patient.dob" )
#'   str_snake_case( "patientDob" )
#'   str_snake_case( "PatientDob" )
#'   
#' @rdname str_snake_case
#' @aliases str_snake_case
#' @export

str_snake_case <- function( 
    string
  , whitespace = getOption('lettercase.whitespace', '[^\\w\\s-\\.]' ) 
) { #
  
  if( ! is.character(string) ) stop( as.character(sys.call())[-1], ' is not character' )
  
  # for( ac in acronyms )  string <- gsub( tolower(ac), ac, string )
  
  # The first two lines accommodate CamelCase: https://stackoverflow.com/questions/1175208/elegant-python-function-to-convert-camelcase-to-snake-case/1176023#1176023
  string <- gsub("(.)([A-Z][a-z]+)" , "\\1_\\2", string, perl=TRUE )                 # Separate w/ dashes based on capitalization
  string <- gsub("([a-z0-9])([A-Z])", "\\1_\\2", string, perl=TRUE )
  
  string <- gsub( '[^\\w\\s-\\.]', '', string, perl=TRUE )
  string <- tolower(string)
  string <- gsub( pattern_separators, '_', string, perl=TRUE )
  string <- gsub( '__+', '_', string, perl=TRUE )  # Replace multiple with single _'s
  string <- gsub( '^_+', '', string, perl=TRUE )   # Drop leading _'s if exist
  string <- gsub( '_+$', '', string, perl=TRUE )   # Drop trailing _'s if exist
  
  return(string)
  
}

