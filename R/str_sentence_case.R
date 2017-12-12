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
  # stolent from https://stackoverflow.com/questions/18509527/first-letter-to-upper-case
  substr(string, 1, 1) <- toupper(substr(string, 1, 1))
  string
}
