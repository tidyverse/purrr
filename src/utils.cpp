#include <Rcpp.h>

using namespace Rcpp;


// Efficient list to data frame conversion
SEXP as_data_frame(const SEXP x) {
  IntegerVector row_names = IntegerVector::create(
    IntegerVector::get_na(),
    -(Rf_length(get_vector_elt(x, 0)))
  );
  Rf_setAttrib(x, Rf_install("row.names"), row_names);

  CharacterVector classes = CharacterVector::create("tbl_df", "data.frame");
  Rf_setAttrib(x, R_ClassSymbol, classes);

  return x;
}


int is_atomic(int x) {
  switch(x) {
  case CHARSXP:
  case LGLSXP:
  case INTSXP:
  case REALSXP:
  case CPLXSXP:
  case STRSXP:
  case RAWSXP:
    return 1;
  default:
    return 0;
  }
}

int is_atomic(const SEXP x) {
  return is_atomic(TYPEOF(x));
}


int is_function(int fun) {
  switch(fun) {
  case CLOSXP:
  case SPECIALSXP:
  case BUILTINSXP:
    return 1;
  default:
    return 0;
  }
}

int is_function(const SEXP fun) {
  return is_function(TYPEOF(fun));
}

SEXP get_ij_elt(const SEXP x, int i, int j) {
  return get_vector_elt(get_vector_elt(x, j), i);
}

int first_type(List& results) {
  int type = 0, i = 0;
  while (i < results.size() && type == 0) {
    type = TYPEOF(results[i]);
    ++i;
  }
  return type;
}

int sexp_type(SEXP x) {
  return TYPEOF(x);
}
