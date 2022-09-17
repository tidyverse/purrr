if (getRversion() < "4.1") {
  dir.create("man/macros", showWarnings = FALSE, recursive = TRUE)
  cat(
    paste(
      "\\renewcommand{\\examples}{\\section{Examples}{",
      "These examples are designed to work in R >= 4.1 so that we can take",
      "advantage of modern syntax like the base pipe (\\verb{|>}) and the ",
      "function shorthand (\\verb{\\(x) x + 1}). They might not work on the ",
      "version of R that you're using.",
      "\\preformatted{#1}}}",
      collapse = ""
    ),
    file = "man/macros/examples.Rd"
  )
}
