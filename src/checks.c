#include <Rinternals.h>
#include <stdbool.h>

/**
 * @brief Check any SEXP object for being a single TRUE/FALSE value; logical NA is excluded
 *
 * @param value An R object (SEXP)
 * @return 1 if bool, 0 otherwise
 */
bool is_bool(SEXP value) {
  return TYPEOF(value) == LGLSXP && LENGTH(value) == 1 && LOGICAL(value)[0] != NA_LOGICAL;
}

/**
 * @brief Check any SEXP object for being any kind of NA
 *
 * @param value An R object (SEXP)
 * @return 1 if NA, 0 otherwise
 */
bool is_na(SEXP value) {
  // NULL is not NA
  if (value == R_NilValue) return false;

  switch (TYPEOF(value)) {
  case LGLSXP:
    return LENGTH(value) == 1 && (LOGICAL(value)[0] == NA_LOGICAL);
  case INTSXP:
    return LENGTH(value) == 1 && (INTEGER(value)[0] == NA_INTEGER);
  case REALSXP:
    return LENGTH(value) == 1 && ISNA(REAL(value)[0]);
  case CPLXSXP:
    if (LENGTH(value) != 1) return false;
    Rcomplex c = COMPLEX(value)[0];
    return ISNA(c.r) || ISNA(c.i);
  case STRSXP:
    return LENGTH(value) == 1 &&  (STRING_ELT(value, 0) == NA_STRING);
  default:
    // Other types cannot be NA
      return false;
  }
}
