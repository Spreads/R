.onLoad <- function(libname, pkgname){
  # print("Loading Spreads package")
}

.onAttach <- function(libname, pkgname){
  spreads_env <- .spreads_load_env()
  spreads_env[['Hello']] <- function(){
    #callin a function defined in spreads.c
    .Call("spreads_welcome")
  }
  spreads_env[['Echo']] <- function(...) {
    return(list(...))
  }
  spreads_env[['Add42']] <- function(...) {
    lapply(list(...), function(x) { x + 42})
  }
  spreads_env[['RegisterFunction']] <- function(name, func) {
    env = .spreads_load_env()
    env[[as.character(name)]] <- func
    filepath <- file.path(path = .spreads_env_path(), "Spreads.Environment.RData")
    saveRDS(env, file = filepath)
    spreads_env[[as.character(name)]] <- func
  }
  spreads_env[['RemoveFunction']] <- function(name) {
    if(name == 'RegisterFunction') {
      stop("Cannot remove RegisterFunction")
    }
    if(name == 'RemoveFunction') {
      stop("Cannot remove RemoveFunction")
    }
    env = .spreads_load_env()
    rm(list = c(name), envir = env)
    filepath <- file.path(path = .spreads_env_path(), "Spreads.Environment.RData")
    saveRDS(env, file = filepath)
    rm(list = c(name), envir = spreads_env)
  }
  Spreads <<- spreads_env
  Spreads[['Version']] <- 0.1
  Spreads$Hello()
}