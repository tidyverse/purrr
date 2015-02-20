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
