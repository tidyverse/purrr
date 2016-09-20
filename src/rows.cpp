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

} // namespace rows


extern "C" SEXP by_slice_impl(SEXP env, SEXP d_name_, SEXP f_name_) {
  BEGIN_RCPP
  const char* d_name = CHAR(Rf_asChar(d_name_));

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

extern "C" SEXP map_by_slice_impl(SEXP env, SEXP d_name_, SEXP f_name_, SEXP slices) {
  BEGIN_RCPP
  const char* d_name = CHAR(Rf_asChar(d_name_));
  SEXP d = Rf_install(d_name);
  SEXP d_val = Rf_eval(d, env);

  // Map over those lists
  for (int i = 0; i < Rf_length(slices); ++i) {
    Rf_defineVar(d, get_vector_elt(slices, i), env);
    SEXP result = PROTECT(map_impl(env, d_name_, f_name_, Rf_mkChar("list")));
    set_vector_elt(slices, i, as_data_frame(result));
    UNPROTECT(1);
  }

  // Create the output data frame
  return rows::process_slices(slices, env);
  END_RCPP
}
