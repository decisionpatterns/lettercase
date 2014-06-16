#' TitleCase
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
#'   TitleCase("one flew over the cuckoo's nest")   
#'   TitleCase('on the road')
#'   
#' @rdname TitleCase
#' @include str_title_case.R LetterCase.R
#' @export   

TitleCase <- setClass( 'TitleCase', contains='LetterCase' )

setAs( 'character', 'TitleCase'
  , function(from) {
    
    from <- str_title_case(from)
    
    object <- TitleCase()
    object@.Data <- from
    return(object)
  }
)
