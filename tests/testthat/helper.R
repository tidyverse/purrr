expect_bare <- function(x, type) {
  predicate <- switch(
    type,
    logical = is_bare_logical,
    integer = is_bare_integer,
    double = is_bare_double,
    complex = is_bare_complex,
    character = is_bare_character,
    raw = is_bare_raw,
    list = is_bare_list,
  )

  expect_true(predicate(x))
}

local_name_repair_quiet <- function(frame = caller_env()) {
  local_options(rlib_name_repair_verbosity = "quiet", .frame = frame)
}
local_name_repair_verbose <- function(frame = caller_env()) {
  local_options(rlib_name_repair_verbosity = "verbose", .frame = frame)
}

local_methods <- function(..., .frame = caller_env()) {
  local_bindings(..., .env = global_env(), .frame = .frame)
}
