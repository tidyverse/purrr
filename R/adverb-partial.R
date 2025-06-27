#' Partially apply a function, filling in some arguments
#'
#' Partial function application allows you to modify a function by pre-filling
#' some of the arguments. It is particularly useful in conjunction with
#' functionals and other function operators.
#'
#' @details
#' `partial()` creates a function that takes `...` arguments. Unlike
#' [compose()] and other function operators like [negate()], it
#' doesn't reuse the function signature of `.f`. This is because
#' `partial()` explicitly supports NSE functions that use
#' `substitute()` on their arguments. The only way to support those is
#' to forward arguments through dots.
#'
#' Other unsupported patterns:
#'
#' - It is not possible to call `partial()` repeatedly on the same
#'   argument to pre-fill it with a different expression.
#'
#' - It is not possible to refer to other arguments in pre-filled
#'   argument.
#'
#' @param .f a function. For the output source to read well, this should be a
#'   named function.
#' @param ... named arguments to `.f` that should be partially applied.
#'
#'   Pass an empty `... = ` argument to specify the position of future
#'   arguments relative to partialised ones. See
#'   [rlang::call_modify()] to learn more about this syntax.
#'
#'   These dots support quasiquotation. If you unquote a value, it is
#'   evaluated only once at function creation time.  Otherwise, it is
#'   evaluated each time the function is called.
#' @param .env `r lifecycle::badge("deprecated")` The environments are
#'   now captured via quosures.
#' @param .first `r lifecycle::badge("deprecated")` Please pass an
#'   empty argument `... = ` to specify the position of future
#'   arguments.
#' @param .lazy `r lifecycle::badge("deprecated")` Please unquote the
#'   arguments that should be evaluated once at function creation time
#'   with `!!`.
#'
#' @inheritSection safely Adverbs
#' @inherit safely return
#' @family adverbs
#' @export
#' @examples
#' # Partial is designed to replace the use of anonymous functions for
#' # filling in function arguments. Instead of:
#' compact1 <- function(x) discard(x, is.null)
#'
#' # we can write:
#' compact2 <- partial(discard, .p = is.null)
#'
#' # partial() works fine with functions that do non-standard
#' # evaluation
#' my_long_variable <- 1:10
#' plot2 <- partial(plot, my_long_variable)
#' plot2()
#' plot2(runif(10), type = "l")
#'
#' # Note that you currently can't partialise arguments multiple times:
#' my_mean <- partial(mean, na.rm = TRUE)
#' my_mean <- partial(my_mean, na.rm = FALSE)
#' try(my_mean(1:10))
#'
#'
#' # The evaluation of arguments normally occurs "lazily". Concretely,
#' # this means that arguments are repeatedly evaluated across invocations:
#' f <- partial(runif, n = rpois(1, 5))
#' f
#' f()
#' f()
#'
#' # You can unquote an argument to fix it to a particular value.
#' # Unquoted arguments are evaluated only once when the function is created:
#' f <- partial(runif, n = !!rpois(1, 5))
#' f
#' f()
#' f()
#'
#'
#' # By default, partialised arguments are passed before new ones:
#' my_list <- partial(list, 1, 2)
#' my_list("foo")
#'
#' # Control the position of these arguments by passing an empty
#' # `... = ` argument:
#' my_list <- partial(list, 1, ... = , 2)
#' my_list("foo")
partial <- function(
  .f,
  ...,
  .env = deprecated(),
  .lazy = deprecated(),
  .first = deprecated()
) {
  args <- enquos(...)

  fn_expr <- enexpr(.f)
  .fn <- switch(
    typeof(.f),
    builtin = ,
    special = as_closure(.f),
    closure = .f,
    cli::cli_abort(
      "{.arg .f} must be a function, not {.obj_type_friendly { .f }}.",
      arg = ".f"
    )
  )

  if (lifecycle::is_present(.env)) {
    lifecycle::deprecate_warn("0.3.0", "partial(.env)", always = TRUE)
  }
  if (lifecycle::is_present(.lazy)) {
    lifecycle::deprecate_warn("0.3.0", "partial(.lazy)", always = TRUE)
    if (!.lazy) {
      args <- map(
        args,
        ~ new_quosure(eval_tidy(.x, env = caller_env()), empty_env())
      )
    }
  }
  if (lifecycle::is_present(.first)) {
    lifecycle::deprecate_warn("0.3.0", "partial(.first)", always = TRUE)
  }

  env <- caller_env()
  heterogeneous_envs <- !every(args, quo_is_same_env, env)

  if (!heterogeneous_envs) {
    args <- map(args, quo_get_expr)
  }

  # Reuse function symbol if possible
  fn_sym <- if (is_symbol(fn_expr)) fn_expr else quote(.fn)

  if (is_false(.first)) {
    # For compatibility
    call <- call_modify(call2(fn_sym), ... = , !!!args)
  } else {
    # Pass on `...` from parent function. It should be last, this way if
    # `args` also contain a `...` argument, the position in `args`
    # prevails.
    call <- call_modify(call2(fn_sym), !!!args, ... = )
  }

  if (heterogeneous_envs) {
    # Forward caller environment where S3 methods might be defined.
    # See design note below.
    call <- new_quosure(call, env)

    # Unwrap quosured arguments if possible
    call <- quo_invert(call)

    # Derive a mask where dots can be forwarded
    mask <- new_data_mask(env(!!fn_sym := .fn))

    fn <- function(...) {
      mask$... <- environment()$...
      eval_tidy(call, mask)
    }
  } else {
    body <- expr({
      !!fn_sym <- !!.fn
      !!call
    })
    fn <- new_function(pairlist2(... = ), body, env = env)
  }

  structure(
    fn,
    class = c("purrr_function_partial", "function"),
    body = call
  )
}

#' @export
print.purrr_function_partial <- function(x, ...) {
  cat("<partialised>\n")

  body(x) <- partialised_body(x)
  print(x, ...)
}

partialised_body <- function(x) attr(x, "body")

# For !!fn_sym <- !!.fn
utils::globalVariables("!<-")


# helpers -----------------------------------------------------------------

quo_invert <- function(call) {
  call <- duplicate(call, shallow = TRUE)

  if (is_quosure(call)) {
    rest <- quo_get_expr(call)
  } else {
    rest <- call
  }
  if (!is_call(rest)) {
    cli::cli_abort("Expected a call", .internal = TRUE)
  }

  first_quo <- NULL

  # Find first quosured argument. We unwrap constant quosures which
  # add no scoping information.
  while (!is_null(rest)) {
    elt <- node_car(rest)

    if (is_quosure(elt)) {
      if (quo_is_constant(elt)) {
        # Unwrap constant quosures
        node_poke_car(rest, quo_get_expr(elt))
      } else if (is_null(first_quo)) {
        # Record first quosured argument
        first_quo <- elt
        first_node <- rest
      }
    }

    rest <- node_cdr(rest)
  }

  if (is_null(first_quo)) {
    return(call)
  }

  # Take the wrapping quosure env as reference if there is one.
  # Otherwise, take the first quosure detected in arguments.
  if (is_quosure(call)) {
    env <- quo_get_env(call)
    call <- quo_get_expr(call)
  } else {
    env <- quo_get_env(first_quo)
  }

  rest <- first_node
  while (!is_null(rest)) {
    cur <- node_car(rest)

    if (is_quosure(cur) && is_reference(quo_get_env(cur), env)) {
      node_poke_car(rest, quo_get_expr(cur))
    }

    rest <- node_cdr(rest)
  }

  new_quosure(call, env)
}

quo_is_constant <- function(quo) {
  is_reference(quo_get_env(quo), empty_env())
}

quo_is_same_env <- function(x, env) {
  quo_env <- quo_get_env(x)
  is_reference(quo_env, env) || is_reference(quo_env, empty_env())
}
