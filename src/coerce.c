#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include <stdio.h>

void cant_coerce(SEXP from, SEXP to, int i) {
  Rf_errorcall(R_NilValue, "Can't coerce element %i from a %s to a %s",
    i + 1, Rf_type2char(TYPEOF(from)), Rf_type2char(TYPEOF(to)));
}

int real_to_logical(double x, SEXP from, SEXP to, int i) {
  if (R_IsNA(x)) {
    return NA_LOGICAL;
  } else if (x == 0) {
    return 0;
  } else if (x == 1) {
    return 1;
  } else {
    cant_coerce(from, to, i);
    return 0;
  }
}

int real_to_integer(double x, SEXP from, SEXP to, int i) {
  if (R_IsNA(x)) {
    return NA_INTEGER;
  }
  int out = x;

  if (out == x) {
    return out;
  } else {
    cant_coerce(from, to, i);
    return 0;
  }
}

int integer_to_logical(double x, SEXP from, SEXP to, int i) {
  if (x == NA_INTEGER) {
    return NA_LOGICAL;
  } else if (x == 0) {
    return 0;
  } else if (x == 1) {
    return 1;
  } else {
    cant_coerce(from, to, i);
    return 0;
  }
}

double logical_to_real(int x) {
  return (x == NA_LOGICAL) ? NA_REAL : x;
}
double integer_to_real(int x) {
  return (x == NA_INTEGER) ? NA_REAL : x;
}
SEXP logical_to_char(int x, SEXP from, SEXP to, int i) {
  if (x == NA_LOGICAL) {
    return NA_STRING;
  } else {
    cant_coerce(from, to, i);
    return NILSXP;
  }
}

void set_vector_value(SEXP to, int i, SEXP from, int j) {
  switch(TYPEOF(to)) {
  case LGLSXP:
    switch(TYPEOF(from)) {
    case LGLSXP: LOGICAL(to)[i] = LOGICAL(from)[j]; break;
    case INTSXP: LOGICAL(to)[i] = integer_to_logical(INTEGER(from)[j], from, to, i); break;
    case REALSXP: LOGICAL(to)[i] = real_to_logical(REAL(from)[j], from, to, i); break;
    default: cant_coerce(from, to, i);
    }
    break;
  case INTSXP:
    switch(TYPEOF(from)) {
    case LGLSXP: INTEGER(to)[i] = LOGICAL(from)[j]; break;
    case INTSXP: INTEGER(to)[i] = INTEGER(from)[j]; break;
    case REALSXP: INTEGER(to)[i] = real_to_integer(REAL(from)[j], from, to, i); break;
    default: cant_coerce(from, to, i);
    }
    break;
  case REALSXP:
    switch(TYPEOF(from)) {
    case LGLSXP:  REAL(to)[i] = logical_to_real(LOGICAL(from)[j]); break;
    case INTSXP:  REAL(to)[i] = integer_to_real(INTEGER(from)[j]); break;
    case REALSXP: REAL(to)[i] = REAL(from)[j]; break;
    default: cant_coerce(from, to, i);
    }
    break;
  case STRSXP:
    switch(TYPEOF(from)) {
    case LGLSXP:  SET_STRING_ELT(to, i, logical_to_char(LOGICAL(from)[j], from, to, i)); break;
    case STRSXP:  SET_STRING_ELT(to, i, STRING_ELT(from, j)); break;
    default: cant_coerce(from, to, i);
    }
    break;
  case VECSXP:
    SET_VECTOR_ELT(to, i, from);
    break;
  case RAWSXP:
    switch(TYPEOF(from)) {
    case RAWSXP: RAW(to)[i] = RAW(from)[j]; break;
    default: cant_coerce(from, to, i);
    }
    break ;
  default: cant_coerce(from, to, i);
  }
}


SEXP coerce_impl(SEXP x, SEXP type_) {
  int n = Rf_length(x);

  SEXPTYPE type = Rf_str2type(CHAR(Rf_asChar(type_)));
  SEXP out = PROTECT(Rf_allocVector(type, n));

  for (int i = 0; i < n; ++i) {
    set_vector_value(out, i, x, i);
  }

  UNPROTECT(1);
  return out;
}
