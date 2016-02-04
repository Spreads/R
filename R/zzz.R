.onLoad <- function(libname, pkgname){
  print("Loading Spreads package")
  Spreads.Version <<- 0.1   ## A global variable
  library("zoo")
}