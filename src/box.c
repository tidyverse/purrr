#define R_NO_REMAP
#include <Rinternals.h>
#include <stdbool.h>

/**
 * Check if an object is a done box
 *
 * @param out Object to test for being a done box.
 * @param check_empty Whether to require box to be empty (given by its attribute).
 * 
 * @return `TRUE` if a done box, `FALSE` otherwise.
 */
bool is_done_box(SEXP out, bool check_empty) {
  return Rf_inherits(out, "rlang_box_done") &&
    (!check_empty || Rf_asLogical(Rf_getAttrib(out, Rf_install("empty"))));
}

SEXP unbox(SEXP box) {
  return VECTOR_ELT(box, 0);
}
