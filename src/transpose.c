#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include "utils.h"

SEXP transpose_impl(SEXP x, SEXP names_template) {
  if (TYPEOF(x) != VECSXP) {
    Rf_errorcall(R_NilValue, "`.l` must be a list, not %s", friendly_typeof(x));
  }

  int n = Rf_length(x);
  if (n == 0) {
    return Rf_allocVector(VECSXP, 0);
  }

  int has_template = !Rf_isNull(names_template);

  SEXP x1 = VECTOR_ELT(x, 0);
  if (!Rf_isVector(x1)) {
    Rf_errorcall(R_NilValue, "Element 1 must be a vector, not %s", friendly_typeof(x1));
  }
  int m = has_template ? Rf_length(names_template) : Rf_length(x1);

  // Create space for output
  SEXP out = PROTECT(Rf_allocVector(VECSXP, m));
  SEXP names1 = PROTECT(Rf_getAttrib(x, R_NamesSymbol));

  for (int j = 0; j < m; ++j) {
    SEXP xj = PROTECT(Rf_allocVector(VECSXP, n));
    if (!Rf_isNull(names1)) {
      Rf_setAttrib(xj, R_NamesSymbol, names1);
    }
    SET_VECTOR_ELT(out, j, xj);
    UNPROTECT(1);
  }

  SEXP names2 = has_template ? names_template : Rf_getAttrib(x1, R_NamesSymbol);
  if (!Rf_isNull(names2)) {
    Rf_setAttrib(out, R_NamesSymbol, names2);
  }

  // Fill output
  for (int i = 0; i < n; ++i) {
    SEXP xi = VECTOR_ELT(x, i);
    if (!Rf_isVector(xi)) {
      Rf_errorcall(R_NilValue, "Element %d must be a vector, not %s", i + 1, friendly_typeof(xi));
    }


    // find mapping between names and index. Use -1 to indicate not found
    SEXP names_i = Rf_getAttrib(xi, R_NamesSymbol);
    SEXP index;
    if (!Rf_isNull(names2) && !Rf_isNull(names_i)) {
      index = PROTECT(Rf_match(names_i, names2, 0));
      // Rf_match returns 1-based index; convert to 0-based for C
      for (int i = 0; i < m; ++i) {
        INTEGER(index)[i] = INTEGER(index)[i] - 1;
      }
    } else {
      index = PROTECT(Rf_allocVector(INTSXP, m));
      int mi = Rf_length(xi);

      if (m != mi) {
        Rf_warningcall(R_NilValue, "Element %d must be length %d, not %d", i + 1, m, mi);
      }
      for (int i = 0; i < m; ++i) {
        INTEGER(index)[i] = (i < mi) ? i : -1;
      }

    }
    int* pIndex = INTEGER(index);

    for (int j = 0; j < m; ++j) {
      int pos = pIndex[j];
      if (pos == -1)
        continue;

      switch(TYPEOF(xi)) {
      case LGLSXP:
        SET_VECTOR_ELT(VECTOR_ELT(out, j), i, Rf_ScalarLogical(LOGICAL(xi)[pos]));
        break;
      case INTSXP:
        SET_VECTOR_ELT(VECTOR_ELT(out, j), i, Rf_ScalarInteger(INTEGER(xi)[pos]));
        break;
      case REALSXP:
        SET_VECTOR_ELT(VECTOR_ELT(out, j), i, Rf_ScalarReal(REAL(xi)[pos]));
        break;
      case STRSXP:
        SET_VECTOR_ELT(VECTOR_ELT(out, j), i, Rf_ScalarString(STRING_ELT(xi, pos)));
        break;
      case VECSXP:
        SET_VECTOR_ELT(VECTOR_ELT(out, j), i, VECTOR_ELT(xi, pos));
        break;
      default:
        Rf_errorcall(R_NilValue,
                     "Transposed element must be a vector, not %s",
                     friendly_typeof(xi));
      }
    }

    UNPROTECT(1);
  }

  UNPROTECT(2);
  return out;
}
