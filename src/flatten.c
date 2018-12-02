#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include "coerce.h"
#include "conditions.h"
#include "utils.h"

const char* objtype(SEXP x) {
  return Rf_type2char(TYPEOF(x));
}

SEXP flatten_impl(SEXP x) {
  if (TYPEOF(x) != VECSXP) {
    stop_bad_type(x, "a list", NULL, ".x");
  }
  int m = Rf_length(x);

  // Determine output size and check type
  int n = 0;
  int has_names = 0;
  SEXP x_names = PROTECT(Rf_getAttrib(x, R_NamesSymbol));

  for (int j = 0; j < m; ++j) {
    SEXP x_j = VECTOR_ELT(x, j);
    if (!is_vector(x_j) && x_j != R_NilValue) {
      stop_bad_element_type(x_j, j + 1, "a vector", NULL, ".x");
    }

    n += Rf_length(x_j);
    if (!has_names) {
      if (!Rf_isNull(Rf_getAttrib(x_j, R_NamesSymbol))) {
        // Sub-element is named
        has_names = 1;
      } else if (Rf_length(x_j) == 1 && !Rf_isNull(x_names)) {
        // Element is a "scalar" and has name in parent
        SEXP name = STRING_ELT(x_names, j);
        if (name != NA_STRING && strcmp(CHAR(name), "") != 0)
          has_names = 1;
      }
    }
  }

  SEXP out = PROTECT(Rf_allocVector(VECSXP, n));
  SEXP names = PROTECT(Rf_allocVector(STRSXP, n));
  if (has_names)
    Rf_setAttrib(out, R_NamesSymbol, names);

  int i = 0;
  for (int j = 0; j < m; ++j) {
    SEXP x_j = VECTOR_ELT(x, j);
    int n_j = Rf_length(x_j);

    SEXP names_j = PROTECT(Rf_getAttrib(x_j, R_NamesSymbol));
    int has_names_j = !Rf_isNull(names_j);

    for (int k = 0; k < n_j; ++k, ++i) {
      switch(TYPEOF(x_j)) {
      case LGLSXP:   SET_VECTOR_ELT(out, i, Rf_ScalarLogical(LOGICAL(x_j)[k])); break;
      case INTSXP:   SET_VECTOR_ELT(out, i, Rf_ScalarInteger(INTEGER(x_j)[k])); break;
      case REALSXP:  SET_VECTOR_ELT(out, i, Rf_ScalarReal(REAL(x_j)[k])); break;
      case CPLXSXP:  SET_VECTOR_ELT(out, i, Rf_ScalarComplex(COMPLEX(x_j)[k])); break;
      case STRSXP:   SET_VECTOR_ELT(out, i, Rf_ScalarString(STRING_ELT(x_j, k))); break;
      case RAWSXP:   SET_VECTOR_ELT(out, i, Rf_ScalarRaw(RAW(x_j)[k])); break;
      case VECSXP:   SET_VECTOR_ELT(out, i, VECTOR_ELT(x_j, k)); break;
      default:
        Rf_error("Internal error: `flatten_impl()` should have failed earlier");
      }
      if (has_names) {
        if (has_names_j) {
          SET_STRING_ELT(names, i, has_names_j ? STRING_ELT(names_j, k) : Rf_mkChar(""));
        } else if (n_j == 1) {
          SET_STRING_ELT(names, i, !Rf_isNull(x_names) ? STRING_ELT(x_names, j) : Rf_mkChar(""));
        }
      }
      if (i % 1024 == 0)
        R_CheckUserInterrupt();

    }
    UNPROTECT(1);
  }



  UNPROTECT(3);
  return out;
}

SEXP vflatten_impl(SEXP x, SEXP type_) {
  if (TYPEOF(x) != VECSXP) {
    stop_bad_type(x, "a list", NULL, ".x");
  }
  int m = Rf_length(x);

  SEXPTYPE type = Rf_str2type(CHAR(Rf_asChar(type_)));

  // Determine output size and type
  int n = 0;
  int has_names = 0;
  for (int j = 0; j < m; ++j) {
    SEXP x_j = VECTOR_ELT(x, j);

    n += Rf_length(x_j);
    if (!has_names && !Rf_isNull(Rf_getAttrib(x_j, R_NamesSymbol))) {
      has_names = 1;
    }
  }

  SEXP out = PROTECT(Rf_allocVector(type, n));
  SEXP names = PROTECT(Rf_allocVector(STRSXP, n));
  if (has_names)
    Rf_setAttrib(out, R_NamesSymbol, names);
  UNPROTECT(1);

  int i = 0;
  for (int j = 0; j < m; ++j) {
    SEXP x_j = VECTOR_ELT(x, j);
    int n_j = Rf_length(x_j);

    SEXP names_j = PROTECT(Rf_getAttrib(x_j, R_NamesSymbol));
    int has_names_j = !Rf_isNull(names_j);

    for (int k = 0; k < n_j; ++k, ++i) {
      set_vector_value(out, i, x_j, k);

      if (has_names)
        SET_STRING_ELT(names, i, has_names_j ? STRING_ELT(names_j, k) : Rf_mkChar(""));
      if (i % 1024 == 0)
        R_CheckUserInterrupt();
    }

    UNPROTECT(1);
  }

  UNPROTECT(1);
  return out;
}
