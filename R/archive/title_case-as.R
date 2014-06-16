#' @include Class-title_case.R
#' @name as
#' @rdname title_case
setAs( 'character', 'title_case', function(from) .title_case(from) )

#' @name as
#' @rdname title_case
setAs( 'snake_case', 'title_case', function(from) .title_case(from) )





#' @examples 
#'   as.title_case( "one flew over the cuckoo's_nest" )
#' @rdname title_case

as.title_case <- function(x) as(x, 'title_case' )       


