#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include <stdio.h>

const char* sixteen = "0123456789abcdef" ;

SEXP raw_to_char( Rbyte x){
  char buf[2] ;
  buf[0] = sixteen[ x >> 4] ;
  buf[1] = sixteen[ x & 0x0F ] ;
  return Rf_mkCharLen( buf, 2) ;
}

double logical_to_real(int x) {
  return (x == NA_LOGICAL) ? NA_REAL : x;
}
double integer_to_real(int x) {
  return (x == NA_INTEGER) ? NA_REAL : x;
}
SEXP logical_to_char(int x) {
  if (x == NA_LOGICAL)
    return NA_STRING;

  return Rf_mkChar(x ? "TRUE" : "FALSE");
}
SEXP integer_to_char(int x) {
  if (x == NA_INTEGER)
    return NA_STRING;

  char buf[100];
  snprintf(buf, 100, "%d", x);
  return Rf_mkChar(buf);
}
SEXP double_to_char(double x) {
  if (!R_finite(x)) {
    if (R_IsNA(x)) {
      return NA_STRING;
    } else if (R_IsNaN(x)) {
      return Rf_mkChar("NaN");
    } else if (x > 0) {
      return Rf_mkChar("Inf");
    } else {
      return Rf_mkChar("-Inf");
    }
  }

  char buf[100];
  snprintf(buf, 100, "%f", x);
  return Rf_mkChar(buf);
}

void cant_coerce(SEXP from, SEXP to, int i) {
  Rf_errorcall(R_NilValue, "Can't coerce element %i from a %s to a %s",
    i + 1, Rf_type2char(TYPEOF(from)), Rf_type2char(TYPEOF(to)));
}

void set_vector_value(SEXP to, int i, SEXP from, int j) {
  switch(TYPEOF(to)) {
  case LGLSXP:
    switch(TYPEOF(from)) {
    case LGLSXP: LOGICAL(to)[i] = LOGICAL(from)[j]; break;
    default: cant_coerce(from, to, i);
    }
    break;
  case INTSXP:
    switch(TYPEOF(from)) {
    case LGLSXP: INTEGER(to)[i] = LOGICAL(from)[j]; break;
    case INTSXP: INTEGER(to)[i] = INTEGER(from)[j]; break;
    case RAWSXP: INTEGER(to)[i] = RAW(from)[j]; break ;
    default: cant_coerce(from, to, i);
    }
    break;
  case REALSXP:
    switch(TYPEOF(from)) {
    case LGLSXP:  REAL(to)[i] = logical_to_real(LOGICAL(from)[j]); break;
    case INTSXP:  REAL(to)[i] = integer_to_real(INTEGER(from)[j]); break;
    case REALSXP: REAL(to)[i] = REAL(from)[j]; break;
    case RAWSXP:  REAL(to)[i] = RAW(from)[j]; break ;
    default: cant_coerce(from, to, i);
    }
    break;
  case STRSXP:
    switch(TYPEOF(from)) {
    case LGLSXP:  SET_STRING_ELT(to, i, logical_to_char(LOGICAL(from)[j])); break;
    case INTSXP:  SET_STRING_ELT(to, i, integer_to_char(INTEGER(from)[j])); break;
    case REALSXP: SET_STRING_ELT(to, i, double_to_char(REAL(from)[j])); break;
    case STRSXP:  SET_STRING_ELT(to, i, STRING_ELT(from, j)); break;
    case RAWSXP:  SET_STRING_ELT(to, i, raw_to_char(RAW(from)[j])); break;
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
