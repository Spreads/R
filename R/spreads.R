#' Hello Spreads.
#'
#' Prints "Hello Spreads!"
#' @examples
#' hello_speads()
#' @noRd
hello_speads <- function(){
  .Call("hello_spreads")
}


#' Returns the same object back
#'
#' @examples
#' spreads_echo()
#' @noRd
spreads_echo <- function(x, ...) {
   return(x)
}

spreads_call <- function(name = "spreads_echo", ...) {
  args <- as.list(substitute(list(...)))[-1L]
  do.call(name, args)
}

spreads_add42 <- function(x, ...) {
  x + 42
}

