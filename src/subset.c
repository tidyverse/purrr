#define R_NO_REMAP
#include <Rinternals.h>

SEXP subset_list(SEXP list, int from, int to) {
  const SEXPTYPE type = VECSXP;
  const int output_length = to - from + 1;

  // Copy subset of values
  SEXP out = PROTECT(Rf_allocVector(type, output_length));

  for (int i = 0; i < output_length; i++) {
    SET_VECTOR_ELT(out, i, VECTOR_ELT(list, from + i));
  }

  // Copy subset of names (if they exist)
  SEXP input_names = Rf_getAttrib(list, R_NamesSymbol);

  if (input_names != R_NilValue) {
    SEXP output_names = PROTECT(Rf_allocVector(STRSXP, output_length));
    for (int i = 0; i < output_length; i++) {
      SET_STRING_ELT(output_names, i, STRING_ELT(input_names, from + i));
    }
    Rf_setAttrib(out, R_NamesSymbol, output_names);
    UNPROTECT(1);  // output_names
  }

  UNPROTECT(1);  // out
  return out;
}