#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>

void set_vector_value(SEXP to, int i, SEXP from, int j) {

  switch(TYPEOF(to)) {
  case LGLSXP:
    switch(TYPEOF(from)) {
    case LGLSXP: LOGICAL(to)[i] = LOGICAL(from)[j]; break;
    default:     Rf_errorcall(R_NilValue, "Element %i is not a logical vector.", i + 1);
    }
    break;
  case INTSXP:
    switch(TYPEOF(from)) {
    case LGLSXP: INTEGER(to)[i] = LOGICAL(from)[j]; break;
    case INTSXP: INTEGER(to)[i] = INTEGER(from)[j]; break;
    default:     Rf_error("Element %i is not a integer or logical vector.", i + 1);
    }
    break;
  case REALSXP:
    switch(TYPEOF(from)) {
    case LGLSXP:  REAL(to)[i] = LOGICAL(from)[j]; break;
    case INTSXP:  REAL(to)[i] = INTEGER(from)[j]; break;
    case REALSXP: REAL(to)[i] = REAL(from)[j]; break;
    default:      Rf_error("Element %i is not a integer, logical, or double vector.", i + 1);
    }
    break;
  case STRSXP:
    switch(TYPEOF(from)) {
    case LGLSXP:
    case INTSXP:
    case REALSXP: SET_STRING_ELT(to, i, Rf_asChar(from)); break;
    case STRSXP:  SET_STRING_ELT(to, i, STRING_ELT(from, 0)); break;
    default:      Rf_error("Element %i is not a integer, logical, double, or character vector.", i + 1);
    }
    break;
  case VECSXP:  SET_VECTOR_ELT(to, i, from); break;
  default:      Rf_error("Unsupported type %s", Rf_type2char(TYPEOF(to)));
  }
}
