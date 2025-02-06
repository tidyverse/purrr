#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include <stdbool.h>

#include "conditions.h"
#include "checks.h"

static SEXP make_call();
static SEXP test_predicate(SEXP env, SEXP ffi_n, SEXP ffi_i, bool initial_value);

SEXP every_impl(SEXP env, SEXP ffi_n, SEXP ffi_i);
SEXP some_impl(SEXP env, SEXP ffi_n, SEXP ffi_i);

SEXP every_impl(SEXP env, SEXP ffi_n, SEXP ffi_i) {
  return test_predicate(env, ffi_n, ffi_i, true);
}

SEXP some_impl(SEXP env, SEXP ffi_n, SEXP ffi_i) {
  return test_predicate(env, ffi_n, ffi_i, false);
}

/**
 * Perform the test of an R predicate .p over a set of values .x.
 *
 * @param env An R environment created inside the parent R function
 * @param ffi_n Length of .x
 * @param ffi_i Integer for iterating over elements of .x; should be equal to 0
 * @param initial_value Answer if length of .x is 0
 * @return A single R logical value, one of TRUE/FALSE/NA
 */
static SEXP test_predicate(SEXP env, SEXP ffi_n, SEXP ffi_i, bool initial_value) {
  int n = INTEGER_ELT(ffi_n, 0);
  int* p_i = INTEGER(ffi_i);

  SEXP call = make_call();

  SEXP out = PROTECT(Rf_allocVector(LGLSXP, 1));
  int* p_out = LOGICAL(out);
  *p_out = initial_value;

  for (int i = 0; i < n; i++) {
    *p_i = i + 1;

    if (i % 1024 == 0) {
      R_CheckUserInterrupt();
    }

    SEXP res = PROTECT(R_forceAndCall(call, 1, env));

    if (is_na(res)) {
      *p_out = NA_LOGICAL;
      UNPROTECT(1);  // res
      continue;
    }

    if (!is_bool(res)) {
      r_abort(
        "`.p()` must return a single `TRUE` or `FALSE`, not %s.",
        rlang_obj_type_friendly_full(res, true, false)
      );
    }

    int res_value = LOGICAL(res)[0];
    UNPROTECT(1);  // res

    if (res_value == !initial_value) {
      *p_out = !initial_value;
      break;
    }
  }

  *p_i = 0;

  UNPROTECT(1);  // out
  return out;
}

/**
 * Create an R call of the form .p(.x[[i]], ...). Since the returned call is always the same,
 * the return value is optimized to persist across calls.
 *
 * @return An R call that reads .p(.x[[i]], ...)
 */
static SEXP make_call() {
  static SEXP call = NULL;
  if (call == NULL) {
    SEXP x_sym = Rf_install(".x");
    SEXP p_sym = Rf_install(".p");
    SEXP i_sym = Rf_install("i");

    // Constructs a call of the form .p(.x[[i]], ...)
    SEXP x_i_sym = PROTECT(Rf_lang3(R_Bracket2Symbol, x_sym, i_sym));

    call = Rf_lang3(p_sym, x_i_sym, R_DotsSymbol);
    R_PreserveObject(call);

    UNPROTECT(1);  // x_i_sym
  }
  return call;
}
