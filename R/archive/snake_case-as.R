#' @include Class-snake_case.R
#' @rdname snake_case
#' @name as
setAs( 'character', 'snake_case', function(from) .snake_case(from) )

#' @rdname snake_case
#' @name as
setAs( 'title_case', 'snake_case', function(from) .snake_case(from) )




# @examples 
#   as.snake_case( "one flew over the cuckoo's_nest" )
#' @rdname snake_case
#' @export
as.snake_case <- function(x) as(x, 'snake_case' )       
