#' title_case
#' 
#' S4 class for Title Case
#' 
#' Title Case is disringuished by:
#' * the capitalization of the first letter of most words, some words are 
#'   omitted
#' * spaces used as white space
#' * special characters are allowed
#' * acronyms are honored
#' 
#' @examples
#'   title_case('one flew over the cuckoo's nest')   
#'   title_case('on the road')
#'   title_case(')
#'   
#' @rdname title_case
#' @export   

title_case <- 
  setClass( 'title_case', contains='character' )

setMethod( 'initialize', 'title_case', 
  function( .Object, ... ) { .Object@.Data <- .title_case(...) ; .Object }
)


#' @rdname title_case
setReplaceMethod( '[', 'title_case', 
  function( x, i, value ) { 
    x[i] <- .title_case(value)  
    x
  }
)

#' @rdname title_case
setReplaceMethod( '[[', 'title_case', 
  function(x,i,value)  { 
    x[[i]] <- .title_case(value)
    x
  }
)


#' @rdname title_case
setAs( 'character', 'title_case', function(from) .title_case(from) )

#' @rdname title_case
setAs( 'snake_case', 'title_case', function(from) .title_case(from) )


#' @rdname title_case
setMethod( 'show', 'title_case', function(object) show(object@.Data) )


#' @examples 
#'   as.title_case( "one flew over the cuckoo's_nest" )
#' @rdname

as.title_case <- function(x) as(x, 'title_case' )       



#' .title_case
#'
#' internal function for converting character to title case.  This is not 
#' exported and should not be called directly. 
#' 
#' @param x object to turn into a title case
#' @param acronyms character; tokens to capitalize
#' 
#' @examples
#'   .title_case( 'One Flew Over The Cuckoo's Nest' )
#'   .title_case( 'one_flew_over_the_cuckoo's_nest' )

.title_case <- function(x ) {
  
  # for( ac in acronyms )  x <- gsub( tolower(ac), ac, x )

  
  x <- gsub( "[\\s_]+", " ", x )  # whitespace to single space
    
  x <- gsub( "\\b([a-z])([a-z]+)", "\\U\\1\\L\\2" ,x, perl=TRUE ) # ucfirst
  
  return(x)
  
}
