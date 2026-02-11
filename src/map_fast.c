#define R_NO_REMAP
#include <Rinternals.h>
// Including <cli/progress.h> before "cleancall.h" because we want to register
// exiting handlers ourselves, rather than letting cli register them for us.
#include <cli/progress.h>

#include "cleancall.h"
#include "coerce.h"
#include "extract.h"

static
void cb_progress_done(void* bar_ptr) {
  SEXP bar = (SEXP)bar_ptr;
  cli_progress_done(bar);
  R_ReleaseObject(bar);
}

static
SEXP map_fast_(
  SEXP (*make_call)(SEXP, SEXP, SEXP, int),
  SEXP env,
  SEXP ffi_type,
  SEXP progress,
  SEXP x,
  SEXP y,
  SEXP ffi_n,
  SEXP names,
  SEXP ffi_i,
  SEXP call_names,
  int force
) {
  SEXPTYPE type = Rf_str2type(CHAR(STRING_ELT(ffi_type, 0)));
  int n = INTEGER_ELT(ffi_n, 0);
  int* p_i = INTEGER(ffi_i);

  SEXP bar = cli_progress_bar(n, progress);
  R_PreserveObject(bar);
  r_call_on_exit((void (*)(void*)) cb_progress_done, (void*) bar);

  SEXP out = PROTECT(Rf_allocVector(type, n));
  Rf_setAttrib(out, R_NamesSymbol, names);

  for (int i = 0; i < n; ++i) {
    *p_i = i + 1;

    if (CLI_SHOULD_TICK) {
      cli_progress_set(bar, i);
    }
    if (i % 1024 == 0) {
      R_CheckUserInterrupt();
    }

    SEXP call = PROTECT(make_call(x, y, call_names, i));
    SEXP res = PROTECT(R_forceAndCall(call, force, env));

    if (type != VECSXP && Rf_length(res) != 1) {
      Rf_errorcall(R_NilValue, "Result must be length 1, not %i.", Rf_length(res));
    }

    set_vector_value(out, i, res, 0);
    UNPROTECT(2);  // res, call
  }

  *p_i = 0;

  UNPROTECT(1);  // out
  return out;
}

static
void update_extracted(SEXP x, int index, SEXP env) {
  SEXP x_i_sym = Rf_install(".x_i");
  SEXP x_i = PROTECT(extract_from_vector(x, index));
  Rf_defineVar(x_i_sym, x_i, env);
  UNPROTECT(1);  // x_i
}

SEXP map_fast_impl(
  SEXP env,
  SEXP ffi_type,
  SEXP progress,
  SEXP x,
  SEXP ffi_n,
  SEXP names,
  SEXP ffi_i
  ) {
  static SEXP call = NULL;
  if (call == NULL) {
    SEXP x_i_sym = Rf_install(".x_i");
    SEXP f_sym = Rf_install(".f");

    call = Rf_lang3(f_sym, x_i_sym, R_DotsSymbol);
    R_PreserveObject(call);
  }

  const int force = 1;

  SEXPTYPE type = Rf_str2type(CHAR(STRING_ELT(ffi_type, 0)));
  int n = INTEGER_ELT(ffi_n, 0);
  int* p_i = INTEGER(ffi_i);

  SEXP bar = cli_progress_bar(n, progress);
  R_PreserveObject(bar);
  r_call_on_exit((void (*)(void*)) cb_progress_done, (void*) bar);

  SEXP out = PROTECT(Rf_allocVector(type, n));
  Rf_setAttrib(out, R_NamesSymbol, names);

  for (int i = 0; i < n; ++i) {
    *p_i = i + 1;

    if (CLI_SHOULD_TICK) {
      cli_progress_set(bar, i);
    }
    if (i % 1024 == 0) {
      R_CheckUserInterrupt();
    }

    update_extracted(x, i, env);
    SEXP res = PROTECT(R_forceAndCall(call, force, env));

    if (type != VECSXP && Rf_length(res) != 1) {
      Rf_errorcall(R_NilValue, "Result must be length 1, not %i.", Rf_length(res));
    }

    set_vector_value(out, i, res, 0);
    UNPROTECT(1);  // res
  }

  *p_i = 0;

  UNPROTECT(1);  // out
  return out;
}

static
SEXP make_map2_call(SEXP x, SEXP y, SEXP call_names, int index) {
  (void) call_names;
  return make_call_2(x, y, index, ".f");
}

SEXP map2_fast_impl(
  SEXP env,
  SEXP ffi_type,
  SEXP progress,
  SEXP x,
  SEXP y,
  SEXP ffi_n,
  SEXP names,
  SEXP ffi_i
) {
  const int force = 2;
  SEXP call_names = R_NilValue;

  return map_fast_(
    make_map2_call,
    env,
    ffi_type,
    progress,
    x,
    y,
    ffi_n,
    names,
    ffi_i,
    call_names,
    force
  );
}

static
SEXP make_pmap_call(SEXP xs, SEXP y, SEXP call_names, int index) {
  (void) y;
  return make_call_n(xs, call_names, index, ".f");
}

SEXP pmap_fast_impl(
  SEXP env,
  SEXP ffi_type,
  SEXP progress,
  SEXP l,
  SEXP ffi_n,
  SEXP names,
  SEXP ffi_i,
  SEXP call_names
) {
  const int force = Rf_length(l);
  SEXP y = R_NilValue;

  return map_fast_(
    make_pmap_call,
    env,
    ffi_type,
    progress,
    l,
    y,
    ffi_n,
    names,
    ffi_i,
    call_names,
    force
  );
}
