#' SnakeCase
#' 
#' Class whose representation is always in Snake Case
#' 
#' Snake Case is disringuished by:
#' * all lowercase letters
#' * whitespace and - represented by single _ (underscore)
#' * special characters not allowed 
#' 
#' Snake Case is commonly used as a naming convention in programs and 
#' databases
#' 
#' @examples
#'   SnakeCase("one flew over the cuckoo's nest")   
#'   SnakeCase("Catch-42")
#' @rdname SnakeCase
#' @export   
#' @include str_snake_case.R

SnakeCase <- setClass( 'SnakeCase', contains='LetterCase' )

#' @name as,character
#' @rdname SnakeCase
setAs( 'character', 'SnakeCase'
  , function(from) {
     from <- str_snake_case(from) 
     
     object <- SnakeCase()
     object@.Data <- from 
     return( object )
  }
)

# setMethod( 'initialize', 'SnakeCase', 
#   function( .Object, ... ) { .Object@.Data <- str_snake_case(...) ; .Object }
# )




# # ---------------------------------------------------------------------
# # Accessor Methods
# # ---------------------------------------------------------------------
# 
# #' @rdname SnakeCase
# #' @name [
# setReplaceMethod( '[', 'SnakeCase',
#                   function( x, i, value ) { 
#                     x[i] <- str_snake_case(value)  
#                     x
#                   }
# )
# 
# #' @rdname SnakeCase
# #' @name `[[`
# setReplaceMethod( '[[', 'SnakeCase', 
#                   function(x,i,value)  { 
#                     x[[i]] <- str_snake_case(value)
#                     x
#                   }
# )
# 
# 
# # ---------------------------------------------------------------------
# # show
# # ---------------------------------------------------------------------
# #' @rdname SnakeCase
# #' @export
# setMethod( 'show', 'SnakeCase', function(object) show(object@.Data) )
# 
# 
# 
# 
