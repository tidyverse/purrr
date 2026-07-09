#define R_NO_REMAP
#include <Rinternals.h>

/**
 * Extract a contiguous subset of a list
 *
 * This function is equivalent to an R call `list[from:to]`. It will also make
 * sure to keep names of the input `list`.
 *
 * @param list An object of type `VECSXP` to subset.
 * @param from First index to include in the output.
 * @param to Last index to include in the output.
 *
 * @return A `VECSXP` object being a subset of `list`.
 */
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