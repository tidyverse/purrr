#include <Rcpp.h>
#include <dplyr.h>
#include "map.h"
#include "utils.h"
#include "rows-data.h"
#include "rows-formatter.h"

using namespace Rcpp;

namespace rows {

List process_slices(List raw_results, const Environment execution_env) {
  rows::Settings settings(execution_env);
  int remove_empty = settings.collation != list;

  rows::Labels labels(execution_env);
  rows::Results results(raw_results, remove_empty);

  if (remove_empty)
    labels.remove(results.empty_index);

  rows::FormatterPtr formatter = rows::Formatter::create(results, labels, settings);

  return formatter->output();
}

SEXP subset_slices(const List data) {
  ListOf<IntegerVector> indices(data.attr("indices"));
  int n_slices = indices.size();

  if (indices.size() == 0) {
    stop("Internal error: data not grouped");
  }

  CharacterVector classes = CharacterVector::create("tbl_df", "data.frame");
  dplyr::DataFrameSubsetVisitors visitors(data);

  List out = no_init(n_slices);
  for (int i = 0; i < n_slices; ++i) {
    out[i] = visitors.subset(indices[i], classes);
  }

  return out;
}

} // namespace rows


extern "C" SEXP by_slice_impl(SEXP env, SEXP d_name_, SEXP f_name_) {
  BEGIN_RCPP
  const char* d_name = CHAR(Rf_asChar(d_name_));
  SEXP d = Rf_install(d_name);
  SEXP d_val = Rf_eval(d, env);

  // Replace x in env with a list of data frames, one for each group
  Rf_defineVar(d, rows::subset_slices(d_val), env);

  // Map over that list
  SEXP results = PROTECT(map_impl(env, d_name_, f_name_, Rf_mkChar("list")));

  // Create the output data frame
  results = PROTECT(rows::process_slices(results, env));

  UNPROTECT(2);
  return results;
  END_RCPP
}

extern "C" SEXP invoke_rows_impl(SEXP env, SEXP d_name_, SEXP f_name_) {
  BEGIN_RCPP
  // Map in parallel over the rows of the data frame
  SEXP results = PROTECT(pmap_impl(env, d_name_, f_name_, Rf_mkChar("list")));

  // Create the output data frame
  results = PROTECT(rows::process_slices(results, env));

  UNPROTECT(2);
  return results;
  END_RCPP
}

extern "C" SEXP map_by_slice_impl(SEXP env, SEXP d_name_, SEXP f_name_) {
  BEGIN_RCPP
  const char* d_name = CHAR(Rf_asChar(d_name_));
  SEXP d = Rf_install(d_name);
  SEXP d_val = Rf_eval(d, env);

  // Create list of data frames, one by slice
  SEXP results = PROTECT(rows::subset_slices(d_val));

  // Map over those lists
  for (int i = 0; i < Rf_length(results); ++i) {
    Rf_defineVar(d, get_vector_elt(results, i), env);
    SEXP result = PROTECT(map_impl(env, d_name_, f_name_, Rf_mkChar("list")));
    set_vector_elt(results, i, as_data_frame(result));
    UNPROTECT(1);
  }

  // Create the output data frame
  results = PROTECT(rows::process_slices(results, env));

  UNPROTECT(2);
  return results;
  END_RCPP
}
