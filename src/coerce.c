#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include <stdio.h>

#include "conditions.h"

void cant_coerce(SEXP from, SEXP to, int i) {

  const char* to_friendly;
  switch(TYPEOF(to)) {
    case INTSXP:
      to_friendly = "an integer";
      break;
    case REALSXP:
      to_friendly = "a double";
      break;
    case STRSXP:
      to_friendly = "a string";
      break;
    case LGLSXP:
      to_friendly = "a logical";
      break;
    case RAWSXP:
      to_friendly = "a raw vector";
      break;
    default:
      to_friendly = Rf_type2char(TYPEOF(to));
  }


  Rf_errorcall(
    R_NilValue,
    "Can't coerce from %s to %s.",
    rlang_obj_type_friendly_full(from, false, false),
    to_friendly
  );
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

void deprecate_to_char(const char* type_char) {
  SEXP type = PROTECT(Rf_mkString(type_char));

  SEXP fun = PROTECT(Rf_lang3(Rf_install(":::"), Rf_install("purrr"), Rf_install("deprecate_to_char")));
  SEXP call = PROTECT(Rf_lang2(fun, type));

  Rf_eval(call, R_GlobalEnv);
  UNPROTECT(3);
}

SEXP logical_to_char(int x, SEXP from, SEXP to, int i) {
  if (x == NA_LOGICAL) {
    return NA_STRING;
  } else {
    if (i == 0)
      deprecate_to_char("logical");
    return Rf_mkChar(x ? "TRUE" : "FALSE");
  }
}

SEXP integer_to_char(int x, int i) {
  if (i == 0)
    deprecate_to_char("integer");

  if (x == NA_INTEGER)
    return NA_STRING;

  char buf[100];
  snprintf(buf, 100, "%d", x);
  return Rf_mkChar(buf);
}
SEXP double_to_char(double x, int i) {
  if (i == 0)
    deprecate_to_char("double");

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
    case INTSXP:  SET_STRING_ELT(to, i, integer_to_char(INTEGER(from)[j], i)); break;
    case REALSXP: SET_STRING_ELT(to, i, double_to_char(REAL(from)[j], i)); break;
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
