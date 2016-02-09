.spreads_env_path <- function() file.path(path.expand("~"), "R", "Spreads", "Interop")
.spreads_data_path <- function() file.path(path.expand("~"), "R", "Spreads", "Data")

.spreads_load_env <- function() {
  path = .spreads_env_path()
  if(!dir.exists(path)){
    dir.create(path, recursive = TRUE)
    #print("Spreads dir created")
  }else{
    #print("Spreads dir exists")
  }
  filepath = file.path(path, "Spreads.Environment.RData")
  if(file.exists(filepath)){
    #print("Loading existing Spreads.Env.RData file")
    #spreads_env = load(filepath) # attach(filepath, pos = 2,warn.conflicts = FALSE)
    spreads_env = readRDS(filepath)
    return(spreads_env)
  }else{
    #print("Creating new Spreads.Env.RData file")
    #prnt = parent.frame()
    spreads_env = new.env(hash = TRUE, parent = emptyenv())
    spreads_env[['Echo']] <- function(...) {
      return(list(...))
    }
    saveRDS(spreads_env, file = filepath)
    return(spreads_env)
  }
}