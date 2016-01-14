#include <Rcpp.h>
#include <dplyr.h>
#include "utils.h"
#include "rows-data.h"

namespace rows {


CollationType hash_collate(const std::string& collate) {
  if (collate == "rows")
    return rows;
  else if (collate == "cols")
    return cols;
  else
    return list;
}

Settings::Settings(Environment execution_env_)
    : output_colname(as<std::string>(execution_env_[".to"])),
      include_labels(execution_env_[".labels"]) {
  collation = hash_collate(as<std::string>(execution_env_[".collate"]));
}


Labels::Labels(Environment execution_env_)
    : are_unique(execution_env_[".unique_labels"]),
      slicing_cols(execution_env_[".slicing_cols"]),
      labels_(execution_env_[".labels_cols"]),
      n_labels_(Rf_length(execution_env_[".labels_cols"])) {
}

void Labels::remove(const std::vector<int>& index) {
  if (index.size()) {
    List labels = labels_; // Workaround GCC -O2 crash
    dplyr::DataFrameSubsetVisitors labels_visitors(labels);
    labels_ = labels_visitors.subset(index, "data.frame");
  }
}

Results::Results(List raw_results_, int remove_empty_)
    : results(raw_results_) {
  determine_first_result_properties();
  if (remove_empty_)
    remove_empty_results();
  determine_results_properties();
}

void Results::determine_first_result_properties() {
  List::iterator first_it = std::find_if(results.begin(), results.end(), is_non_null());

  if (first_it == results.end()) {
    all_nulls_ = 1;
    first_sexp_type = NILSXP;
    first_size = 0;
  } else {
    init_first_result_nonnull();
  }
}

void Results::init_first_result_nonnull() {
  all_nulls_ = 0;

  SEXP first_result = results[0];
  first_sexp_type = TYPEOF(first_result);

  if (Rf_inherits(first_result, "data.frame"))
    first_size = Rf_length(get_vector_elt(first_result, 0));
  else
    first_size = Rf_length(first_result);
}

void Results::remove_empty_results() {
  List::iterator it = results.begin();

  while(it != results.end()) {
    it = std::find_if(it, results.end(), is_empty());
    if (it != results.end()) {
      int i = std::distance(results.begin(), it);
      empty_index.push_back(i);
      ++it;
    }
  }

  // Keep the empty vectors in results for now, only remove NULLs.
  // Useful to keep them as a mold.
  results.erase(std::remove(results.begin(), results.end(), R_NilValue), results.end());
}

void Results::determine_results_properties() {
  n_slices = results.size();
  sizes = (IntegerVector) no_init(n_slices);

  int all_df_ = all_nulls_ ? 0 : 1;
  int equi_typed_ = 1;
  equi_sized = 1;

  for (int i = 0; i < n_slices; ++i) {
    SEXP result_ = results[i];
    int is_df_ = Rf_inherits(result_, "data.frame");
    int result_size_ = is_df_ ? Rf_length(get_vector_elt(result_, 0)) : Rf_length(result_);

    all_df_ *= is_df_;
    equi_typed_ *= sexp_type(result_) == first_sexp_type;
    equi_sized *= result_size_ == first_size;

    sizes[i] = result_size_;
  }

  int all_atomics_ = equi_typed_ && is_atomic(first_sexp_type);

  if (all_atomics_)
    type = (equi_sized && first_size <= 1) ? scalars : vectors;
  else if (all_df_)
    type = dataframes;
  else if (all_nulls_)
    type = nulls;
  else
    type = objects;
}


} // namespace rows
