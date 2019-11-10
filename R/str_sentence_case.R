#' str_sentence_case
#' 
#' Format a string in sentence case
#' 
#' @param string character string to transform
#' 
#' Sentance case is ...
#' 
#' @export

str_sentence_case <- function( string ) {
    # adapted from https://stackoverflow.com/questions/18509527/first-letter-to-upper-case
    # behave as expected, even for short string (i.e. "" or "a")
    substr(string, 1, 1) <- toupper(substr(string, 1, 1))
    substr(string, 2, nchar(string)) <- tolower(substr(string, 2, nchar(string)))
    string
}
