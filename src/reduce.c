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

bool is_done_box(SEXP out, bool check_empty) {
  // TODO: Think if it's possible to make one static "empty" R string for all calls
  return Rf_inherits(out, "rlang_box_done") &&
    (!check_empty || Rf_asLogical(Rf_getAttrib(out, Rf_mkChar("empty"))));
}

SEXP unbox(SEXP box) {
  return VECTOR_ELT(box, 0);
}

SEXP reduce_impl(
  SEXP ffi_env,
  SEXP ffi_n,
  SEXP ffi_i,
  SEXP ffi_init,
  SEXP left_arg,
  SEXP init_missing_arg,
  SEXP progress
) {
  const int n = INTEGER_ELT(ffi_n, 0);
  int* p_i = INTEGER(ffi_i);
  const bool left = Rf_asLogical(left_arg);
  const bool init_missing = Rf_asLogical(init_missing_arg);
  const int init_value = init_missing ? 1 : 0;

  SEXP bar = cli_progress_bar(n, progress);
  R_PreserveObject(bar);
  r_call_on_exit((void (*)(void*)) cb_progress_done, (void*) bar);

  SEXP out = Rf_duplicate(ffi_init);
  PROTECT_INDEX out_shelter;
  PROTECT_WITH_INDEX(out, &out_shelter);

  for (int i = init_value; i < n; i++) {
    if (CLI_SHOULD_TICK) {
      cli_progress_set(bar, i);
    }
    if (i % 1024 == 0) {
      R_CheckUserInterrupt();
    }

    *p_i = left ? i + 1 : n - i;

    static SEXP x_i_sym = NULL;
    if (x_i_sym == NULL) {
      SEXP x_sym = Rf_install(".x");
      SEXP i_sym = Rf_install("i");

      // Constructs a call of the form x[[i]]
      x_i_sym = Rf_lang3(R_Bracket2Symbol, x_sym, i_sym);
      R_PreserveObject(x_i_sym);
    }

    SEXP f_sym = Rf_install(".f");
    // Left-reduce passes the result-so-far on the left, right-reduce
    // passes it on the right. A left-reduce produces left-leaning
    // computation trees while right-reduce produces right-leaning trees.
    SEXP call = PROTECT(left ? Rf_lang4(f_sym, out, x_i_sym, R_DotsSymbol) :
      Rf_lang4(f_sym, x_i_sym, out, R_DotsSymbol));

    const int force = 2; // Number of arguments to force
    SEXP res = PROTECT(R_forceAndCall(call, force, ffi_env));

    if (is_done_box(res, false)) {
      if (is_done_box(res, true)) {
        UNPROTECT(3);  // res, call, out
        return out;
      }
      SEXP unboxed_res = unbox(res);
      UNPROTECT(3);  // res, call, out
      return unboxed_res;
    }

    out = res;
    REPROTECT(out, out_shelter);

    UNPROTECT(2);  // res, call
  }

  *p_i = 0;

  UNPROTECT(1);  // out
  return out;
}
