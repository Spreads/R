.onLoad <- function(libname, pkgname){
  # print("Loading Spreads package")
}

.onAttach <- function(libname, pkgname){
  Spreads.Version <<- 0.1   ## A global variable
  print("Spreads package attached")
  spreads_env <<- .spreads_load_env()
}