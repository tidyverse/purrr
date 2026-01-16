#define R_NO_REMAP
#include <Rinternals.h>
// Including <progress.h> before "cleancall.h" because we want to register
// exiting handlers ourselves, rather than letting cli register them for us.
#include <cli/progress.h>
#include "cleancall.h"

static
void cb_progress_done(void* bar_ptr) {
  SEXP bar = (SEXP)bar_ptr;
  cli_progress_done(bar);
  R_ReleaseObject(bar);
}

SEXP make_progress_bar(int n, SEXP progress) {
  SEXP bar = cli_progress_bar(n, progress);
  R_PreserveObject(bar);
  r_call_on_exit((void (*)(void*)) cb_progress_done, (void*) bar);
  return bar;
}

void set_progress(SEXP bar, int i) {
  if (CLI_SHOULD_TICK) {
    cli_progress_set(bar, i);
  }
}
