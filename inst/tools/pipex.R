
fix_examples <- function() {
  # nothing to do if R is recent
  if (getRversion() >= "4.1") return()

  dir.create("man/macros", showWarnings = FALSE, recursive = TRUE)
  writeLines(
    "\\renewcommand{\\examples}{\\section{Examples}{\\preformatted{#1}}}",
    "man/macros/examples.Rd"
  )
}

if (is.null(sys.calls())) invisible(fix_examples())
