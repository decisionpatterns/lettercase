
#' snake_case
#' 
#' S4 class for Snake Case
#' 
#' Snake Case is disringuished by:
#' * all lowercase letters
#' * whitespace represented by single _ (underscore)
#' * special characters not allowed 
#' 
#' @examples
#'   snake_case('one flew over the cuckoo's nest')   
#'   snake_case('on the road')
#'   snake_case(')
#' @rdname snake_case
#' @export   




snake_case <- 
  setClass( 'snake_case', contains='character' )

setMethod( 'initialize', 'snake_case', 
           function( .Object, ... ) { .Object@.Data <- .snake_case(...) ; .Object }
)


#' @rdname snake_case
setReplaceMethod( '[', 'snake_case', 
                  function( x, i, value ) { 
                    x[i] <- .snake_case(value)  
                    x
                  }
)

#' @rdname snake_case
setReplaceMethod( '[[', 'snake_case', 
                  function(x,i,value)  { 
                    x[[i]] <- .snake_case(value)
                    x
                  }
)


#' @rdname snake_case
setAs( 'character', 'snake_case', function(from) .snake_case(from) )

#' @rdname snake_case
setAs( 'snake_case', 'snake_case', function(from) .snake_case(from) )


#' @rdname snake_case
setMethod( 'show', 'snake_case', function(object) show(object@.Data) )


#' @examples 
#'   as.snake_case( "one flew over the cuckoo's_nest" )
#' @rdname

as.snake_case <- function(x) as(x, 'snake_case' )       



#' .snake_case
#'
#' internal function for converting character to title case.  This is not 
#' exported and should not be called directly. 
#' 
#' @param x object to turn into a title case
#' @param acronyms character; tokens to capitalize
#' 
#' @examples
#'   .snake_case( 'One Flew Over The Cuckoo's Nest' )

.snake_case <- function(x, acronyms=NULL ) {
  
  if( ! is.character(x) ) stop( as.character(sys.call())[-1], ' is not character' )
  
  for( ac in acronyms )  x <- gsub( tolower(ac), ac, x )
  
  x <- gsub( '[^\w]', '')
  x <- tolower(x)
  x <- gsub( '\\s+', '_', x, perl=TRUE )
  
  return(x)
}
