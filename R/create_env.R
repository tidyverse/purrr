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
