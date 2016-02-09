Spreads.Call <- function(..., name = "Echo") {
  args <- as.list(substitute(list(...)))[-1L]
  func <- Spreads[[name]]
  func(...)
}