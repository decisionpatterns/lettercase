#' LetterCase
#' 
#' Super class for managing the 'letter case' of strings. LetterCase is meant to be
#' subclassed to automatically conform and translate character strings. 
#' 
#' @param from object to coerce into LetterCase class
#' 
#' @param ... Additional arguments
#' 
#' The LetterCase class contains/inherits from \code{character} 
#' and has no other slots.  
#' 
#' * Extending LetterCase
#' 
#' @slot .init function; optional function of a single argument that coerces a \code{character} 
#' object into the representation for this class. This will a
#' 
#' @slot ... data to be placed into the slot 
#' 
#' LetterCase is made to be easily extended. Extending LetterCase has two requirements: 
#' * a class defininition inheriting (\code{contains='LetterCase'}) 
#' * a coercion method (\code{as}) that character to the NewClass 
#'  
#' @examples
#'   LetterCase("one flew over the cuckoo's nest")   
#'   LetterCase('on the road')
#'  
# '   # * Extending LetterCase: 
# ' \dontrun{
# '   
# '   fooBAR <- c('foo', 'BAR')
# '   LowerCase <- setClass( 
# '     'LowerCase', contains='LetterCase'
# '     , prototype = prototype(.init=tolower) 
# '   ) 
# '   
# '   x <- LowerCase( fooBAR ) 
# '   class(x) 
# '   x
# '   
# '   UpperCase <- setClass( 
# '     'UpperCase', contains='LetterCase'
# '     , prototype = prototype(.init=toupper) 
# '   ) 
# '    
# '   x <- UpperCase( fooBAR ) 
# '   class(x) 
# '   x  
# ' }
# ' 
#' @rdname LetterCase
#' @name LetterCase
#' @export   

LetterCase <- setClass( 'LetterCase', contains=c('character') )


#' The \code{initialize} method protects against some problems.
#'   If ... has length 0, an empty object is returned
#'   If ... has multiple arguments an error is thrown
#' @rdname LetterCase 

setMethod( 
  'initialize', 'LetterCase', 
  function( .Object, ... ) { 
    data <- list(...)
    
    if( length(data) == 0 ) return(.Object)
   
    if( length(data) == 1 ) { 
      data <- data[[1]]
      if( class(data) == class(.Object) ) return(data) 
    } else { 
      data <- as.character(data)
    }
    
    .Object <- as( data, class(.Object))
    return(.Object)
  }
)
  


#' @name as
#' @rdname LetterCase

setAs( 'character', 'LetterCase'
 , function(from) {
   message( "In as character -> LetterCase ")
   
     # from <- from   # Redefine inputs 
     
     object <- LetterCase() 
     object@.Data <- from
     return(object)
     
 }
)

# ---------------------------------------------------------------------
# SHOW 
# ---------------------------------------------------------------------

#' @rdname LetterCase
setMethod( 'show', 'LetterCase', 
  function(object) { 
    print(object@.Data)
  }
)



# ---------------------------------------------------------------------
# Accessors 
# ---------------------------------------------------------------------
#' @name `[<-`
#' @rdname LetterCase




setReplaceMethod( 
  '[', 'LetterCase', 
  function( x, i, value ) { 
    message( class(x) )
    message( class(value))
    if( existsMethod( 'as', c( class(x), class(value) ) ) ) 
      x <- as( value, class(x) ) else
      x@.Data[i] <- x@.init(value)  

    return(x)
  }
)

#' @name [[
#' @rdname LetterCase
setReplaceMethod( '[[', 'LetterCase', 
  function(x,i,value)  { 
    x[[i]] <- str_title_case(value)
    x
  }
)
