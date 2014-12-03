#' Common string transformations 
#' 
#' Perform common transformations on strings
#' 
#' @param string character vector
#' 
#' These function take a single character vector argument and return a character
#' vector that has had one or more functions applied to it. They are the 
#' building blocks for building up case transformations.
#' 
#' @return character vector
#' 
#' @examples 
#' 
#' # TRANSFORMATIONS
#'   str_capitalize( "abc" )               # ABC
#'   str_decapitalize( "ABC" )             # abc
#'   str_ucfirst( "abc def" )              # Abc Def
#'   str_expand_capwords( "AbcDef")        # Abc Def
#'   
#' # DELETION
#'   str_delete_whitespace( "ABC 123" )    # ABC123
#'   str_delete_connectors( "A_B-C.123" )  # ABC123
#'   str_delete_nonword( "ABC & 123" )     # ABC123
#'   
#' @rdname string-transformations
#' @include make_str_replace.R
#' @export

  str_capitalize <- toupper 
  
  # Alternative form:
  # make_str_replace( '([a-z])', '\\U\\1' ) 


#' @rdname string-transformations
#' @export
  str_decapitalize <- tolower 

  # Alternative form:
  # make_str_replace( '([A-Z])', '\\L\\1' ) 


#' @rdname string-transformations
#' @export
   str_ucfirst <- make_str_replace( "\\b([a-z])([a-z]+)", "\\U\\1\\L\\2" )


#' @rdname string-transformations
#' @export
  str_delete_whitespace <- make_str_delete( pattern=pattern_whitespace )


#' @rdname string-transformations
#' @export
  str_delete_connectors <- make_str_delete( pattern=pattern_connectors )


#' @rdname string-transformations
#' @export
  str_delete_nonword    <- make_str_delete( pattern=pattern_nonword )


#' @rdname string-transformations
#' @export
  str_expand_capwords <- make_str_replace( pattern = '([a-z])([A-Z])', replacement = '\\1 \\2' )


#' @rdname string-transformations
#' @export
  str_delete_leading_nonword <- make_str_delete( )
 