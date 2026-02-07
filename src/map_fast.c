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

SEXP map_fast_impl(
  SEXP env,
  SEXP ffi_type,
  SEXP progress,
  SEXP x,
  SEXP ffi_n,
  SEXP names,
  SEXP ffi_i
  ) {
  const int force = 1;
  SEXP y = R_NilValue;
  SEXP call_names = R_NilValue;

  return map_fast_(
    make_map_call,
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
