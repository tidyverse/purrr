#' Capture side effects.
#'
#' These functions wrap functions so that instead of generating side effects
#' through printed output, messages, warnings, and errors, they return enhanced
#' output. They are all adverbs because they modify the action of a verb (a
#' function).
#'
#' If you would like to include a function created with `safely`, `slowly`, or
#' `insistently` in a package, see [faq-adverbs-export].
#'
#' @inheritParams map
#' @param quiet Hide errors (`TRUE`, the default), or display them
#'   as they occur?
#' @param otherwise Default value to use when an error occurs.
#' @return `safely`: wrapped function instead returns a list with
#'   components `result` and `error`. If an error occurred, `error` is
#'   an `error` object and `result` has a default value (`otherwise`).
#'   Else `error` is `NULL`.
#'
#'   `quietly`: wrapped function instead returns a list with components. 
#'   `result`, `output`, `messages` and `warnings`. This function does 
#'   not provide error handling, instead it acts to capture what would
#'   have been printed output.
#'
#'   `possibly`: wrapped function uses a default value (`otherwise`)
#'   whenever an error occurs.
#' @export
#' @examples
#' safe_log <- safely(log)
#' safe_log(10)
#' safe_log("a")
#'
#' list("a", 10, 100) %>%
#'   map(safe_log) %>%
#'   transpose()
#'
#' # This is a bit easier to work with if you supply a default value
#' # of the same type and use the simplify argument to transpose():
#' safe_log <- safely(log, otherwise = NA_real_)
#' list("a", 10, 100) %>%
#'   map(safe_log) %>%
#'   transpose() %>%
#'   simplify_all()
#'
#' # To replace errors with a default value, use possibly().
#' list("a", 10, 100) %>%
#'   map_dbl(possibly(log, NA_real_))
#'
#' # For interactive usage, auto_browse() is useful because it automatically
#' # starts a browser() in the right place.
#' f <- function(x) {
#'   y <- 20
#'   if (x > 5) {
#'     stop("!")
#'   } else {
#'     x
#'   }
#' }
#' if (interactive()) {
#'   map(1:6, auto_browse(f))
#' }
#'
#' # It doesn't make sense to use auto_browse with primitive functions,
#' # because they are implemented in C so there's no useful environment
#' # for you to interact with.
safely <- function(.f, otherwise = NULL, quiet = TRUE) {
  .f <- as_mapper(.f)
  function(...) capture_error(.f(...), otherwise, quiet)
}

#' @export
#' @rdname safely
quietly <- function(.f) {
  .f <- as_mapper(.f)
  function(...) capture_output(.f(...))
}

#' @export
#' @rdname safely
possibly <- function(.f, otherwise, quiet = TRUE) {
  .f <- as_mapper(.f)
  force(otherwise)

  function(...) {
    tryCatch(.f(...),
      error = function(e) {
        if (!quiet)
          message("Error: ", e$message)
        otherwise
      },
      interrupt = function(e) {
        stop("Terminated by user", call. = FALSE)
      }
    )
  }
}

#' @export
#' @rdname safely
auto_browse <- function(.f) {
  if (is_primitive(.f)) {
    abort("Can not auto_browse() primitive functions")
  }

  function(...) {
    withCallingHandlers(
      .f(...),
      error = function(e) {
        # 1: h(simpleError(msg, call))
        # 2: .handleSimpleError(function (e)  <...>
        # 3: stop(...)
        frame <- ctxt_frame(4)
        browse_in_frame(frame)
      },
      warning = function(e) {
        if (getOption("warn") >= 2) {
          frame <- ctxt_frame(7)
          browse_in_frame(frame)
        }
      },
      interrupt = function(e) {
        stop("Terminated by user", call. = FALSE)
      }
    )
  }
}

browse_in_frame <- function(frame) {
  # ESS should problably set `.Platform$GUI == "ESS"`
  # In the meantime, check that ESSR is attached
  if (is_scoped("ESSR")) {
    # Workaround ESS issue
    with_env(frame$env, on.exit({
      browser()
      NULL
    }))
    return_from(frame)
  } else {
    eval_bare(quote(browser()), env = frame$env)
  }
}

capture_error <- function(code, otherwise = NULL, quiet = TRUE) {
  tryCatch(
    list(result = code, error = NULL),
    error = function(e) {
      if (!quiet)
        message("Error: ", e$message)

      list(result = otherwise, error = e)
    },
    interrupt = function(e) {
      stop("Terminated by user", call. = FALSE)
    }
  )
}

capture_output <- function(code) {
  warnings <- character()
  wHandler <- function(w) {
    warnings <<- c(warnings, w$message)
    invokeRestart("muffleWarning")
  }

  messages <- character()
  mHandler <- function(m) {
    messages <<- c(messages, m$message)
    invokeRestart("muffleMessage")
  }

  temp <- file()
  sink(temp)
  on.exit({
    sink()
    close(temp)
  })

  result <- withCallingHandlers(
    code,
    warning = wHandler,
    message = mHandler
  )

  output <- paste0(readLines(temp, warn = FALSE), collapse = "\n")

  list(
    result = result,
    output = output,
    warnings = warnings,
    messages = messages
  )
}
