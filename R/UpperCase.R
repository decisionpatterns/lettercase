#' UpperCase
#' 
#' Class for object in which all entries are maintained as UpperCase
#'
#' @seealso 
#'   \code{\link{LowerCase}}
#'   \code{\link[stringr]{str_uppercase}}
#'   \code{\link[base]{toupper}}
#'   
#' @examples
#'   UpperCase(letters)
#'   UpperCase( 'foo', 'bar' )
#'   
#' @rdname UpperCase
#' @name UpperCase
#' @include LetterCase.R str_upper_case.R
#' @export

UpperCase <- setClass( 'UpperCase', contains='LetterCase' )


#' @name as,character
#' @rdname UpperCase
#' @export

setAs( 'character', 'UpperCase',
  function(from) {
    from <- str_upper_case( from )
    
    object <- UpperCase()
    object@.Data <- from
    return(object)
  }
)
