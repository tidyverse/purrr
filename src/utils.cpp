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

int first_type(const List& results) {
  int type = 0, i = 0;
  while (i < results.size() && type == 0) {
    type = TYPEOF(results[i]);
    ++i;
  }
  return type;
}

int sexp_type(const SEXP x) {
  return TYPEOF(x);
}

CharacterVector get_element_names(const List& x, int i) {
  RObject subset(x[i]);
  return Rf_getAttrib(subset, R_NamesSymbol);
}

void check_dataframes_names_consistency(const List& x) {
  CharacterVector ref = get_element_names(x, 0);
  int equi_named = 1;

  for (int i = 0; i < x.size(); ++i) {
    CharacterVector names = get_element_names(x, i);
    equi_named *= std::equal(ref.begin(), ref.end(), names.begin());
  }

  if (!equi_named)
    stop("data frames do not have consistent names");
}


std::vector<SEXPTYPE> get_element_types(const List& x, int i) {
  List subset(x[i]);
  int n = subset.length();
  std::vector<SEXPTYPE> types(n);

  std::transform(subset.begin(), subset.end(), types.begin(), sexp_type);
  return types;
}

void check_dataframes_types_consistency(const List& x) {
  std::vector<SEXPTYPE> ref = get_element_types(x, 0);
  int equi_typed = 1;

  for (int i = 0; i < x.size(); ++i) {
    std::vector<SEXPTYPE> names = get_element_types(x, i);
    equi_typed *= std::equal(ref.begin(), ref.end(), names.begin());
  }

  if (!equi_typed)
    stop("data frames do not have consistent types");
}

void check_dataframes_consistency(const List x) {
  check_dataframes_names_consistency(x);
  check_dataframes_types_consistency(x);
}
