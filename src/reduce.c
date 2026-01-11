#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>

#include <stdbool.h>

// Including <cli/progress.h> before "cleancall.h" because we want to register
// exiting handlers ourselves, rather than letting cli register them for us.
#include <cli/progress.h>
#include "cleancall.h"

static
void cb_progress_done(void* bar_ptr) {
  SEXP bar = (SEXP)bar_ptr;
  cli_progress_done(bar);
  R_ReleaseObject(bar);
}

SEXP reduce_impl(
  SEXP ffi_env,
  SEXP ffi_n,
  SEXP ffi_i,
  SEXP ffi_init,
  SEXP left_arg,
  SEXP progress
) {
  const int n = INTEGER_ELT(ffi_n, 0);
  int* p_i = INTEGER(ffi_i);
  bool left = Rf_asLogical(left_arg);

  SEXP bar = cli_progress_bar(n, progress);
  R_PreserveObject(bar);
  r_call_on_exit((void (*)(void*)) cb_progress_done, (void*) bar);

  SEXP out = Rf_duplicate(ffi_init);
  PROTECT_INDEX out_shelter;
  PROTECT_WITH_INDEX(out, &out_shelter);

  for (int i = *p_i; i < n; i++) {
    *p_i = i + 1;

    if (CLI_SHOULD_TICK) {
      cli_progress_set(bar, i);
    }
    if (i % 1024 == 0) {
      R_CheckUserInterrupt();
    }
    *p_i = left ? *p_i : n - *p_i + 1;

    static SEXP x_i_sym = NULL;
    if (x_i_sym == NULL) {
      SEXP x_sym = Rf_install(".x");
      SEXP i_sym = Rf_install("i");

      // Constructs a call of the form x[[i]]
      x_i_sym = Rf_lang3(R_Bracket2Symbol, x_sym, i_sym);
      R_PreserveObject(x_i_sym);
    }

    SEXP f_sym = Rf_install("fn");
    // `out` is updated each iteration and thus the call must be created each time
    SEXP call = PROTECT(Rf_lang4(f_sym, out, x_i_sym, R_DotsSymbol));

    const int force = 2; // Number of arguments to force
    SEXP res = PROTECT(R_forceAndCall(call, force, ffi_env));
    out = res;
    REPROTECT(out, out_shelter);

    UNPROTECT(2); // res, call
  }

  *p_i = 0;

  UNPROTECT(1);  // out
  return out;
}
