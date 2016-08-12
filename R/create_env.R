#' @title Create an environment and export variables to it.
#' @description Creates an environment and exports a list of variables to it.
#' The default parent is .GlobalEnv.
#' @param .vars A named list of variables to export to the environment. The names will
#' be the new names of the objects in the new environment.
#' @inheritParams base::new.env
#' @return The new environment containing the exported variables.
#' @details When calling several functions outside of .GlobalEnv, the entire calling
#' environment is saved with the object. This can lead to unnecessary information being
#' retained in memory or saved to disk. Calling a function in an environment
#' with only the objects required prevents this from happening.
#' @examples
#' env <- create_env(list(iris_new_env = iris))
#' @export
create_env <- function(.vars, hash = TRUE,
                       parent = globalenv(), size = 29L){
  if(is.null(names(.vars))){
    stop(".vars must be a named list.")
  }
  env <- new.env(hash = hash, parent = parent, size = size)
  list(.var = .vars, .nm = names(.vars)) %>%
    purrr::pwalk(function(.var, .nm){
    assign(.nm, .var, envir = env)
  })
  env
}

#' @title Return a function that evaluates in a new environment.
#' @description Returns a function that creates an environment,
#' exports its parameters to it, and evaluates the function in the new environment.
#' The parent is .GlobalEnv.
#' @param .f The function to evaluate.
#' @return A function that evaluates in a new environment with every call.
#' @details When calling several functions outside of .GlobalEnv, the entire calling
#' environment is retained with the object. This can lead to unnecessary information being
#' retained in memory when moving from a parallel cluster or
#' saved to disk. Calling a function in an environment
#' with only the objects required prevents this from happening.
#' @examples
#' in_new_env(lm)(Sepal.Length ~ Sepal.Width, data = iris)
#' @export
in_new_env <- function(.f){
  function(...) {
    params <- list(...)
    env <- new.env(parent = globalenv())
    params <- lapply(params, function(x) {if (inherits(x,"formula")) {environment(x)<-env}; x})
    assign(".params.", params, envir = env)
    env$.f <- .f
    evalq(do.call(".f", .params.), envir=env)
  }
}
