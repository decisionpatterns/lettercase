#' LowerCase
#' 
#' Class for object in which all entries are maintained as LowerCase
#'
#' @seealso 
#'   \code{\link{UpperCase}}
#'   \code{\link{str_lowercase}}
#'   \code{\link[base]{tolower}}
#'   
#' @examples
#'   LowerCase(LETTERS)
#'   LowerCase( 'FOO', 'BAR' )
#'   
#' @rdname LowerCase
#' @name LowerCase
#' @include LetterCase.R str_lower_case.R
#' @export

LowerCase <- setClass( 'LowerCase', contains='LetterCase' )

#' @name as
#' @rdname LowerCase
#' @export
setAs( 'character', 'LowerCase',
   function(from) {
     from <- str_lower_case( from )
     
     object <- LowerCase()
     object@.Data <- from
     return(object)
   }
)
