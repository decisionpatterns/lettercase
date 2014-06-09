#' snake_case
#' 
#' Render string in snake case.
#' 
#' Snake Case is disringuished by:
#' * all lowercase letters
#' * whitespace represented by single _ (underscore)
#' * special characters not allowed 
#' 
#' @examples
#'   snake_case("one flew over the cuckoo's nest")   
#'   
#' @rdname snake_case
#' @export   

snake_case <- 
  setClass( 'snake_case', contains='character' )

setMethod( 'initialize', 'snake_case', 
           function( .Object, ... ) { .Object@.Data <- .snake_case(...) ; .Object }
)


# ---------------------------------------------------------------------
# Accessor Methods
# ---------------------------------------------------------------------

#' @rdname snake_case
#' @name [
setReplaceMethod( '[', 'snake_case', 
                  function( x, i, value ) { 
                    x[i] <- .snake_case(value)  
                    x
                  }
)

#' @rdname snake_case
#' @name `[[`
setReplaceMethod( '[[', 'snake_case', 
                  function(x,i,value)  { 
                    x[[i]] <- .snake_case(value)
                    x
                  }
)


# ---------------------------------------------------------------------
# show
# ---------------------------------------------------------------------
#' @rdname snake_case
#' @export
setMethod( 'show', 'snake_case', function(object) show(object@.Data) )




#' .snake_case
#'
#' internal function for converting character to title case.  This is not 
#' exported and should not be called directly. 
#' 
#' @param x object to turn into a title case
#' @param acronyms character; tokens to capitalize
#' 
#' @examples
#'   .snake_case( "One Flew Over The Cuckoo's Nest" )
#' @rdname snake_case
.snake_case <- function(x, acronyms=NULL ) {
  
  if( ! is.character(x) ) stop( as.character(sys.call())[-1], ' is not character' )
  
  for( ac in acronyms )  x <- gsub( tolower(ac), ac, x )
  
  x <- gsub( '[^\\w]', '')
  x <- tolower(x)
  x <- gsub( '\\s+', '_', x, perl=TRUE )
  
  return(x)
}