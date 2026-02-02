#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include <stdbool.h>

#include "conditions.h"

static
bool is_bool(SEXP x) {
  return TYPEOF(x) == LGLSXP && Rf_xlength(x) == 1 && !R_IsNA(LOGICAL_ELT(x, 0));
}

/**
 * C loop for `detect_index()`
 *
 * Uses `vctrs_vec_compat()` at the R level so that we can use `vec_size()` to
 * compute `n`, while also using `[[` to extract elements, which is consistent
 * with `map()`.
 *
 * Very similar to `satisfies_predicate()` used by `every()`, `some()`, and
 * `none()`. The differences are:
 * - this function returns an index of the element that satisfies the predicate,
 *   while the other one returns a boolean;
 * - this function doesn't allow NA, while the other one propagates it;
 * - this function allows both "forward" and "backward" directions, while the
 *   other one has only implicit "forward".
 */
static
int which_satisfies_predicate(SEXP env, SEXP ffi_n, SEXP ffi_i, SEXP left_arg) {
  const bool left = Rf_asLogical(left_arg);
  const int n = INTEGER_ELT(ffi_n, 0);
  int* p_i = INTEGER(ffi_i);

  static SEXP call = NULL;
  if (call == NULL) {
    SEXP x_sym = Rf_install(".x");
    SEXP p_sym = Rf_install(".p");
    SEXP i_sym = Rf_install("i");

    // Constructs a call of the form .p(.x[[i]], ...)
    SEXP x_i_sym = PROTECT(Rf_lang3(R_Bracket2Symbol, x_sym, i_sym));

    call = Rf_lang3(p_sym, x_i_sym, R_DotsSymbol);
    R_PreserveObject(call);

    UNPROTECT(1);
  }

  int out = 0;

  for (int i = 0; i < n; ++i) {
    int r_index = left ? i + 1 : n - i;
    *p_i = r_index;

    if (i % 1024 == 0) {
      R_CheckUserInterrupt();
    }

    SEXP elt_sexp = PROTECT(R_forceAndCall(call, 1, env));

    if (!is_bool(elt_sexp)) {
      // We don't pass `.purrr_error_call` through `.Call()` so we can avoid
      // evaluating it when it isn't needed, so we have to retrieve it when
      // required.
      SEXP error_call = PROTECT(Rf_eval(Rf_install(".purrr_error_call"), env));

      r_abort_call(
        error_call,
        "`.f()` must return a single `TRUE` or `FALSE`, not %s.",
        rlang_obj_type_friendly_full(elt_sexp, true, false)
      );
    }

    const int elt = LOGICAL_ELT(elt_sexp, 0);
    UNPROTECT(1);

    if (elt) {
      // Early exit
      out = r_index;
      break;
    }
  }

  *p_i = 0;

  return out;
}

SEXP detect_index_impl(SEXP ffi_env, SEXP ffi_n, SEXP ffi_i, SEXP left_arg) {
  const int which = which_satisfies_predicate(ffi_env, ffi_n, ffi_i, left_arg);
  return Rf_ScalarInteger(which);
}
