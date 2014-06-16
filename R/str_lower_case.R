#' @rdname str_upper_case
#' @aliases str_lower_case lower_case
#' @export

str_lower_case <- function(string) {
  if( ! is.character(string) ) stop( as.character(sys.call())[-1], ' is not character' ) 
  tolower(string)
}