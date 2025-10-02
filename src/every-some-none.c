#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include <stdbool.h>

#include "conditions.h"

/**
 * Is `x` a scalar logical?
 *
 * Notably we bypass the class and any attributes, i.e. `structure(TRUE, foo =
 * "bar", class = "my-class")` does count for these purrr functions for
 * historical reasons. We also ignore any R level `length()` method, but that
 * would be incredibly rare to see here.
 */
static inline
bool is_scalar_logicalish(SEXP x) {
  return TYPEOF(x) == LGLSXP && Rf_xlength(x) == 1;
}

/**
 * C loop for `every()`, `some()`, and `none()`
 *
 * Uses `vctrs_vec_compat()` at the R level so that we can use `vec_size()` to
 * compute `n`, while also using `[[` to extract elements, which is consistent
 * with `map()`.
 */
static
SEXP satisfies_predicate(
  SEXP env,
  SEXP ffi_n,
  SEXP ffi_i,
  int initial,
  int early_stop
) {
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

  // Number of arguments within `call` to force.
  // Same as `map()`.
  const int force = 1;

  int out = initial;

  for (int i = 0; i < n; ++i) {
    *p_i = i + 1;

    if (i % 1024 == 0) {
      R_CheckUserInterrupt();
    }

    SEXP elt_sexp = PROTECT(R_forceAndCall(call, force, env));

    if (!is_scalar_logicalish(elt_sexp)) {
      // We don't pass `.purrr_error_call` through `.Call()` so we can avoid
      // evaluating it when it isn't needed, so we have to retrieve it when
      // required.
      SEXP error_call = PROTECT(Rf_eval(Rf_install(".purrr_error_call"), env));

      r_abort_call(
        error_call,
        "`.p()` must return a single `TRUE`, `FALSE`, or `NA`, not %s.",
        rlang_obj_type_friendly_full(elt_sexp, true, false)
      );
    }

    const int elt = LOGICAL_ELT(elt_sexp, 0);
    UNPROTECT(1);

    if (elt == early_stop) {
      // Early exit
      out = !initial;
      break;
    }

    if (elt == NA_LOGICAL) {
      // Propagate `NA`, but keep going
      out = NA_LOGICAL;
    }
  }

  *p_i = 0;

  return Rf_ScalarLogical(out);
}

SEXP every_impl(SEXP ffi_env, SEXP ffi_n, SEXP ffi_i) {
  return satisfies_predicate(ffi_env, ffi_n, ffi_i, 1, 0);
}
SEXP some_impl(SEXP ffi_env, SEXP ffi_n, SEXP ffi_i) {
  return satisfies_predicate(ffi_env, ffi_n, ffi_i, 0, 1);
}
SEXP none_impl(SEXP ffi_env, SEXP ffi_n, SEXP ffi_i) {
  return satisfies_predicate(ffi_env, ffi_n, ffi_i, 1, 1);
}
