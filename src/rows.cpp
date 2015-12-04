#include <Rcpp.h>
#include <dplyr.h>
#include "map.h"
#include "rows-data.h"
#include "rows-formatter.h"

using namespace Rcpp;

namespace Slices {

List process_slices(List raw_results, Environment execution_env) {
  Slices::Settings settings(execution_env);
  int remove_empty = settings.collation != list;

  Slices::Labels labels(execution_env);
  Slices::Results results(raw_results, remove_empty);

  if (remove_empty)
    labels.remove(results.empty_index);

  Slices::FormatterPtr formatter = Slices::Formatter::create(results, labels, settings);

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

} // namespace Slices


extern "C" SEXP by_slice_impl(SEXP env, SEXP d_name_, SEXP f_name_) {
  BEGIN_RCPP
  const char* d_name = CHAR(Rf_asChar(d_name_));
  SEXP d = Rf_install(d_name);
  SEXP d_val = Rf_eval(d, env);

  // Replace x in env with a list of data frames, one for each group
  Rf_defineVar(d, Slices::subset_slices(d_val), env);

  // Map over that list
  SEXP results = PROTECT(map_impl(env, d_name_, f_name_, Rf_mkChar("list")));

  // Create the output data frame
  results = PROTECT(Slices::process_slices(results, env));

  UNPROTECT(2);
  return results;
  END_RCPP
}

extern "C" SEXP invoke_rows_impl(SEXP env, SEXP d_name_, SEXP f_name_) {
  BEGIN_RCPP
  // Map in parallel over the rows of the data frame
  SEXP results = PROTECT(pmap_impl(env, d_name_, f_name_, Rf_mkChar("list")));

  // Create the output data frame
  results = PROTECT(Slices::process_slices(results, env));

  UNPROTECT(2);
  return results;
  END_RCPP
}
