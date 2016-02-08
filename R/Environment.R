.spreads_env_path <- function() file.path(path.expand("~"), "R", "Spreads", "Interop")

.spreads_load_env <- function() {
  path = .spreads_env_path()
  if(!dir.exists(path)){
    dir.create(path, recursive = TRUE)
    print("Spreads dir created")
  }else{
    print("Spreads dir exists")
  }
  filepath = file.path(path, "Spreads.Environment.RData")
  if(file.exists(filepath)){
    print("Loading existing Spreads.Env.RData file")
    #spreads_env = load(filepath) # attach(filepath, pos = 2,warn.conflicts = FALSE)
    spreads_env = readRDS(filepath)
    return(spreads_env)
  }else{
    print("Creating new Spreads.Env.RData file")
    #prnt = parent.frame()
    spreads_env = new.env(hash = TRUE, parent = )
    spreads_env[['echo']] <- function(x) {x}
    spreads_env[['add42']] <- function(x) {x + 42}
    #prnt[['spreads_env']] <- spreads_env
    #save('spreads_env', file = filepath) #, envir = parent.frame()
    saveRDS(spreads_env, file = filepath)
    return(spreads_env)
  }
}


.spreads_save_env <- function() {
  path <- .spreads_env_path()
  filepath <- file.path(path, "Spreads.Environment.RData")
  if(!file.exists(filepath)){
    stop("Environment file must exist ")
  }
}

spreads_register <- function(name, func) {
  env = .spreads_load_env()
  env[[as.character(name)]] <- func
  spreads_env[[as.character(name)]] <- func
  filepath <- file.path(path = .spreads_env_path(), "Spreads.Environment.RData")
  saveRDS(env, file = filepath)
}
