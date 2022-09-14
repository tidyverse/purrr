if (getRversion() < "4.1") {
  dir.create("man/macros", showWarnings = FALSE, recursive = TRUE)
  writeLines(
   "\\renewcommand{\\examples}{\\section{Examples}{\\preformatted{#1}}}",
   "man/macros/examples.Rd"
  )
}
