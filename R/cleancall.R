call_with_cleanup <- function(ptr, ...) {
  .Call(cleancall_call, pairlist(ptr, ...), parent.frame())
}
