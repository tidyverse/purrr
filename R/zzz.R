.onLoad <- function(lib, pkg) {
  S7::methods_register()
}

# Work around S7 bug
rm(print)
