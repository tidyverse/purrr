#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include "coerce.h"
#include <string.h>

int find_offset(SEXP x, SEXP index, int i) {
  if (Rf_length(index) > 1) {
    Rf_errorcall(R_NilValue, "Index %i must have length 1", i + 1);
  }

  int n = Rf_length(x);
  if (n == 0)
    return -1;

  if (TYPEOF(index) == INTSXP) {
    int val = INTEGER(index)[0];

    if (val == NA_INTEGER)
      return -1;

    val--;
    if (val < 0 || val >= n)
      return -1;

    return val;
  } if (TYPEOF(index) == REALSXP) {
    double val = REAL(index)[0];

    if (!R_finite(val))
      return -1;

    val--;
    if (val < 0 || val >= n)
      return -1;

    return val;
  } else if (TYPEOF(index) == STRSXP) {
    SEXP names = Rf_getAttrib(x, R_NamesSymbol);
    if (names == R_NilValue) // vector doesn't have names
      return -1;

    if (STRING_ELT(index, 0) == NA_STRING)
      return -1;

    const char* val = Rf_translateCharUTF8(STRING_ELT(index, 0));
    if (val[0] == '\0') // "" matches nothing
      return -1;

    for (int j = 0; j < Rf_length(names); ++j) {
      if (STRING_ELT(names, j) == NA_STRING)
        continue;

      const char* names_j = Rf_translateCharUTF8(STRING_ELT(names, j));
      if (strcmp(names_j, val) == 0)
        return j;

    }
    return -1;
  } else {
    Rf_errorcall(
      R_NilValue,
      "Index %i must be a character or numeric vector", i + 1
    );
  }
}

SEXP extract_vector(SEXP x, SEXP index_i, int i) {
  int offset = find_offset(x, index_i, i);
  if (offset < 0)
    return R_NilValue;

  switch(TYPEOF(x)) {
  case LGLSXP:  return Rf_ScalarLogical(LOGICAL(x)[offset]);
  case INTSXP:  return Rf_ScalarInteger(INTEGER(x)[offset]);
  case REALSXP: return Rf_ScalarReal(REAL(x)[offset]);
  case STRSXP:  return Rf_ScalarString(STRING_ELT(x, offset));
  case VECSXP:  return VECTOR_ELT(x, offset);
  default:
    Rf_errorcall(R_NilValue,
      "Don't know how to index object of type %s at level %i",
      Rf_type2char(TYPEOF(x)), i + 1
    );
  }

  return R_NilValue;
}

SEXP extract_env(SEXP x, SEXP index_i, int i) {
  if (TYPEOF(index_i) != STRSXP || Rf_length(index_i) != 1) {
    Rf_errorcall(R_NilValue, "Index %i is not a string", i + 1);
  }

  SEXP index = STRING_ELT(index_i, 0);
  if (index == NA_STRING)
    return R_NilValue;

  SEXP sym = Rf_installChar(index);
  SEXP out = Rf_findVarInFrame3(x, sym, TRUE);

  return (out == R_UnboundValue) ? R_NilValue : out;
}


SEXP extract_attr(SEXP x, SEXP index_i, int i) {
  if (TYPEOF(index_i) != STRSXP || Rf_length(index_i) != 1) {
    Rf_errorcall(R_NilValue, "Index %i is not a string", i + 1);
  }

  SEXP index = STRING_ELT(index_i, 0);
  if (index == NA_STRING)
    return R_NilValue;

  SEXP sym = Rf_installChar(index);
  return Rf_getAttrib(x, sym);
}

SEXP extract_impl(SEXP x, SEXP index, SEXP missing) {
  if (TYPEOF(index) != VECSXP) {
    Rf_errorcall(R_NilValue, "`index` must be a list (not a %s)",
      Rf_type2char(TYPEOF(index)));
  }

  int n = Rf_length(index);

  for (int i = 0; i < n; ++i) {
    SEXP index_i = VECTOR_ELT(index, i);

    if (Rf_inherits(index_i, "attr")) {
      x = extract_attr(x, index_i, i);
    } else {
      if (Rf_isNull(x)) {
        return missing;
      } else if (Rf_isVector(x)) {
        x = extract_vector(x, index_i, i);
      } else if (Rf_isEnvironment(x)) {
        x = extract_env(x, index_i, i);
      } else if (Rf_isS4(x)) {
        x = extract_attr(x, index_i, i);
      } else {
        Rf_errorcall(R_NilValue,
          "Don't know how to pluck from a %s", Rf_type2char(TYPEOF(x))
        );
      }
    }

  }

  return (Rf_length(x) == 0) ? missing : x;
}

