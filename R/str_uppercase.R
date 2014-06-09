#' str_uppercase, str_lowercases
#' 
#' convert string to upper or lower case
#' 
#' @param string argument passed to \code{toupper}
#' 
#' @export

str_uppercase <- function(string) toupper(string)

#' @rdname srr_uppercase
#' @export
str_lowercase <- function(string) tolower(string)
