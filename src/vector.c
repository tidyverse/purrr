#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>

int can_coerce(SEXPTYPE from, SEXPTYPE to) {

  switch(to) {
  case LGLSXP:  return from == LGLSXP;
  case INTSXP:  return from == LGLSXP || from == INTSXP;
  case REALSXP: return from == LGLSXP || from == INTSXP || from == REALSXP;
  case STRSXP:  return from == LGLSXP || from == INTSXP || from == REALSXP || from == STRSXP;
  case VECSXP:  return 1;
  }

  return 0;
}

void ensure_can_coerce(SEXPTYPE from, SEXPTYPE to, int i) {

  if (can_coerce(from, to))
    return;

  Rf_errorcall(R_NilValue, "Can't coerce element %i from a %s to a %s",
    i + 1, Rf_type2char(from), Rf_type2char(to));

}

void set_vector_value(SEXP to, int i, SEXP from, int j) {
  ensure_can_coerce(TYPEOF(from), TYPEOF(to), i);

  switch(TYPEOF(to)) {
  case LGLSXP:
    switch(TYPEOF(from)) {
    case LGLSXP: LOGICAL(to)[i] = LOGICAL(from)[j]; break;
    }
    break;
  case INTSXP:
    switch(TYPEOF(from)) {
    case LGLSXP: INTEGER(to)[i] = LOGICAL(from)[j]; break;
    case INTSXP: INTEGER(to)[i] = INTEGER(from)[j]; break;
    }
    break;
  case REALSXP:
    switch(TYPEOF(from)) {
    case LGLSXP:  REAL(to)[i] = LOGICAL(from)[j]; break;
    case INTSXP:  REAL(to)[i] = INTEGER(from)[j]; break;
    case REALSXP: REAL(to)[i] = REAL(from)[j]; break;
    }
    break;
  case STRSXP:
    switch(TYPEOF(from)) {
    case LGLSXP:
    case INTSXP:
    case REALSXP: SET_STRING_ELT(to, i, Rf_asChar(from)); break;
    case STRSXP:  SET_STRING_ELT(to, i, STRING_ELT(from, 0)); break;
    }
    break;
  case VECSXP:  SET_VECTOR_ELT(to, i, from); break;
  default:      Rf_errorcall(R_NilValue, "Unsupported type %s", Rf_type2char(TYPEOF(to)));
  }
}
