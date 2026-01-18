#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

// Compile with `-fvisibility=hidden -DHAVE_VISIBILITY_ATTRIBUTE` if you link to this library
#include <R_ext/Visibility.h>
#define export attribute_visible extern

#include "cleancall.h"

extern void unbound_init(void);
extern void map_init(void);

/* .Call calls */
extern SEXP coerce_impl(SEXP, SEXP);
extern SEXP pluck_impl(SEXP, SEXP, SEXP, SEXP);
extern SEXP flatten_impl(SEXP);
extern SEXP every_impl(SEXP, SEXP, SEXP);
extern SEXP some_impl(SEXP, SEXP, SEXP);
extern SEXP none_impl(SEXP, SEXP, SEXP);
extern SEXP map_impl(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP map2_impl(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP pmap_impl(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP reduce_impl(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
  {"reduce_impl",           (DL_FUNC) &reduce_impl,    8},
