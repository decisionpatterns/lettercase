#' str_uppercase, str_lowercases
#' 
#' convert string to upper or lower case
#' 
#' @param string argument to be converted
#' 
#' @section Upper Case and All Caps
#' @details 
#'   \strong{Upper case} or \code{all caps} contains all capital letters. 
#'   Transforming to upperca 
#' 
#' @section Lower Case
#' @details
#'   \code{str_all_caps} is a synonym for \code{str_upper_case}. 
#'   \code{is_all_caps} is a synonym for \code{is_upper_case}.
#' 
#' 
#' 
#' @examples
#' # str_upper_case   
#'   str_upper_case( "one flew over the cuckoo's nest" )
#'   str_upper_case( "catch-22" )  
#' 
#' @rdname str_upper_case
#' @aliases upper_case
#' @export

  str_upper_case <- function(string) {
    if( ! is.character(string) ) stop( deparse( substitute(string) ), ' is not character' ) 
    toupper(string)
  }



#' @rdname str_upper_case 
#' @examples 
#' # is_upper_case 
#'   is_upper_case( 'ABC123' )      # TRUE
#'   is_upper_case( 'abc123' )      # FALSE 
#'   is_upper_case( 'aB'  )         # FALSE 
#'   is_upper_case( '123' )         # TRUE 
  is_upper_case <- function( string ) 
    ! grepl( "[a-z]", string, perl=TRUE )


#' @rdname str_upper_case 
#' @aliases str_all_caps str_uppercase
#' @export

  str_uppercase <- str_upper_case


#' @rdname str_upper_case
#' @aliases is_all_caps
#' @export
  is_uppercase <- str_upper_case


#' @rdname str_upper_case 
#' @aliases str_all_caps str_uppercase
#' @export

  str_all_caps <- str_upper_case


#' @rdname str_upper_case
#' @aliases is_all_caps
#' @export

  is_all_caps <- str_upper_case