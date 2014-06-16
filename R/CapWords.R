#' CapWords
#' 
#' S4 class for CapWords
#' 
#' Title Case is disringuished by:
#' * the capitalization of the first letter of most words, some words are 
#'   omitted
#' * spaces used as white space
#' * special characters are allowed
#' * acronyms are honored
#' 
#' @examples
#'   CapWords("one flew over the cuckoo's nest")   
#'   CapWords('on the road')
#'   
#' @rdname CapWords
#' @include str_cap_words.R LetterCase.R
#' @export   

CapWords <- setClass( 'CapWords', contains='LetterCase' )

setAs( 'character', 'CapWords'
       , function(from) {
         
         from <- str_cap_words(from)
         
         object <- CapWords()
         object@.Data <- from
         return(object)
       }
)
