#define R_NO_REMAP
#include <Rinternals.h>
#include <stdbool.h>

bool is_done_box(SEXP out, bool check_empty) {
  return Rf_inherits(out, "rlang_box_done") &&
    (!check_empty || Rf_asLogical(Rf_getAttrib(out, Rf_install("empty"))));
}

SEXP unbox(SEXP box) {
  return VECTOR_ELT(box, 0);
}
