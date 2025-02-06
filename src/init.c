#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

// Compile with `-fvisibility=hidden -DHAVE_VISIBILITY_ATTRIBUTE` if you link to this library
#include <R_ext/Visibility.h>
#define export attribute_visible extern

#include "cleancall.h"

/* .Call calls */
extern SEXP coerce_impl(SEXP, SEXP);
extern SEXP pluck_impl(SEXP, SEXP, SEXP, SEXP);
extern SEXP flatten_impl(SEXP);
extern SEXP every_impl(SEXP, SEXP, SEXP);
extern SEXP some_impl(SEXP, SEXP, SEXP);
extern SEXP none_impl(SEXP, SEXP, SEXP);
extern SEXP map_impl(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP map2_impl(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP pmap_impl(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP transpose_impl(SEXP, SEXP);
extern SEXP vflatten_impl(SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
  CLEANCALL_METHOD_RECORD,
  {"coerce_impl",           (DL_FUNC) &coerce_impl,    2},
  {"pluck_impl",            (DL_FUNC) &pluck_impl,     4},
  {"flatten_impl",          (DL_FUNC) &flatten_impl,   1},
  {"every_impl",            (DL_FUNC) &every_impl,     3},
  {"some_impl",             (DL_FUNC) &some_impl,      3},
  {"none_impl",             (DL_FUNC) &none_impl,      3},
  {"map_impl",              (DL_FUNC) &map_impl,       6},
  {"map2_impl",             (DL_FUNC) &map2_impl,      6},
  {"pmap_impl",             (DL_FUNC) &pmap_impl,      8},
  {"transpose_impl",        (DL_FUNC) &transpose_impl, 2},
  {"vflatten_impl",         (DL_FUNC) &vflatten_impl,  2},
  {"purrr_eval",            (DL_FUNC) &Rf_eval,        2},
  {NULL, NULL, 0}
};

export void R_init_purrr(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
    cleancall_init();
}
