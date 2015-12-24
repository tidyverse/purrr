#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>

SEXP transpose_impl(SEXP x) {
  if (TYPEOF(x) != VECSXP)
    Rf_errorcall(R_NilValue, "`.l` is not a list (%s)", Rf_type2char(TYPEOF(x)));

  int n = Rf_length(x);
  if (n == 0) {
    SEXP out = Rf_allocVector(VECSXP, 0);
    return out;
  }

  SEXP x1 = VECTOR_ELT(x, 0);
  if (!Rf_isVector(x1))
    Rf_errorcall(R_NilValue, "Element 1 is not a vector (%s)", Rf_type2char(TYPEOF(x1)));
  int m = Rf_length(x1);

  // Create space for output
  SEXP out = PROTECT(Rf_allocVector(VECSXP, m));
  SEXP names1 = Rf_getAttrib(x, R_NamesSymbol);

  for (int j = 0; j < m; ++j) {
    SEXP xj = PROTECT(Rf_allocVector(VECSXP, n));
    if (!Rf_isNull(names1)) {
      Rf_setAttrib(xj, R_NamesSymbol, names1);
    }
    SET_VECTOR_ELT(out, j, xj);
    UNPROTECT(1);
  }

  SEXP names2 = Rf_getAttrib(x1, R_NamesSymbol);
  if (!Rf_isNull(names2)) {
    Rf_setAttrib(out, R_NamesSymbol, names2);
  }

  // Fill output
  for (int i = 0; i < n; ++i) {
    SEXP xi = VECTOR_ELT(x, i);
    if (!Rf_isVector(xi))
      Rf_errorcall(R_NilValue, "Element %i is not a vector (%s)", i + 1, Rf_type2char(TYPEOF(x1)));

    int mi = Rf_length(xi);
    if (mi != m) {
      Rf_warning("Element %i has length %i (not %i)", i + 1, mi, m);
      mi = (mi > m) ? m : mi;
    }

    switch(TYPEOF(xi)) {
    case LGLSXP:
      for (int j = 0; j < mi; ++j) {
        SET_VECTOR_ELT(VECTOR_ELT(out, j), i, Rf_ScalarLogical(LOGICAL(xi)[j]));
      }
      break;
    case INTSXP:
      for (int j = 0; j < mi; ++j) {
        SET_VECTOR_ELT(VECTOR_ELT(out, j), i, Rf_ScalarInteger(INTEGER(xi)[j]));
      }
      break;
    case REALSXP:
      for (int j = 0; j < mi; ++j) {
        SET_VECTOR_ELT(VECTOR_ELT(out, j), i, Rf_ScalarReal(REAL(xi)[j]));
      }
      break;
    case STRSXP:
      for (int j = 0; j < mi; ++j) {
        SET_VECTOR_ELT(VECTOR_ELT(out, j), i, Rf_ScalarString(STRING_ELT(xi, j)));
      }
      break;
    case VECSXP:
      for (int j = 0; j < mi; ++j) {
        SET_VECTOR_ELT(VECTOR_ELT(out, j), i, VECTOR_ELT(xi, j));
      }
      break;
    default:
      Rf_errorcall(R_NilValue, "Unsupported type %s", Rf_type2char(TYPEOF(xi)));
    }


  }

  UNPROTECT(1);
  return out;
}
