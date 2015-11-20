#include <Rcpp.h>
#include <dplyr.h>
#include <boost/lexical_cast.hpp>
#include "fast-copy.h"
#include "utils.h"
#include "map.h"

using namespace Rcpp;


enum SlicesType {
  scalars,
  vectors,
  dataframes,
  nulls,
  objects
};

enum Collation {
  rows,
  cols,
  list
};

Collation hash_collate(std::string collate) {
  if (collate == "rows")
    return rows;
  else if (collate == "cols")
    return cols;
  else
    return list;
}


class SlicesResults {
  List results_;
  List slicing_cols_;
  List labels_;

  int n_rows_, n_cols_;
  int n_slices_, n_labels_;
  IntegerVector results_sizes_;
  std::vector<int> null_pos_;

  SlicesType results_type_;
  Collation collation_;
  int first_sexp_type_, first_size_;
  int unique_labels_;

  RObject create_column(SEXPTYPE type);
  void remove_empty();
  void add_labels(List& out);
  void add_colnames(List& out, std::string& output_colname);
  template<Collation> void add_colnames(
    List& out, std::string& output_colname, CharacterVector& out_names
  );
  int create_row_column(List& out);
  void add_output(List& out);

  template<Collation>
  void add_output(List& out);

public:
  SlicesResults(List results, Environment env);
  List out(std::string output_colname);
};


inline void SlicesResults::remove_empty() {
  // Strip NULL elements from results and labels, though only when
  // collating on rows/cols so we can return NULL objects.
  if (collation_ != list) {
    List::iterator it = results_.begin();
    std::vector<int> empty_index;

    while(it != results_.end()) {
      it = std::find_if(it, results_.end(), is_empty());
      if (it != results_.end()) {
        int i = std::distance(results_.begin(), it);
        empty_index.push_back(i);
        ++it;
      }
    }

    if (empty_index.size()) {
      dplyr::DataFrameSubsetVisitors labels_visitors(labels_);
      labels_ = labels_visitors.subset(empty_index, "data.frame");
      results_.erase(std::remove(results_.begin(), results_.end(), R_NilValue), results_.end());
    }
  }
}

inline SlicesResults::SlicesResults(List results, Environment env)
  : results_(results),
    n_slices_(results_.size()),
    unique_labels_(env[".unique_labels"]),
    slicing_cols_(env[".slicing_cols"]),
    labels_(env[".labels_cols"])
{
  CharacterVector collate = env[".collate"];
  collation_ = hash_collate((std::string) collate[0]);
  n_labels_ = env[".labels"] ? slicing_cols_.size() : 0;

  // Find properties of first non-null result
  int all_nulls;
  List::iterator first_it = std::find_if(results_.begin(), results_.end(), is_non_null());
  if (first_it == results_.end()) {
    all_nulls = 1;
    first_sexp_type_ = NILSXP;
    first_size_ = 0;
  } else {
    all_nulls = 0;
    remove_empty();

    SEXP first_result = results_[0];
    first_sexp_type_ = TYPEOF(first_result);
    if (Rf_inherits(first_result, "data.frame"))
      first_size_ = Rf_length(get_vector_elt(first_result, 0));
    else
      first_size_ = Rf_length(first_result);
  }

  n_slices_ = results_.size();
  results_sizes_ = (IntegerVector) no_init(n_slices_);

  int all_df = 1;
  int all_objects = 1;
  int all_same_type = 1;
  int all_same_size = 1;

  for (int i = 0; i < n_slices_; ++i) {
    SEXP result = results_[i];
    int is_df = Rf_inherits(result, "data.frame");
    int result_size = is_df ? Rf_length(get_vector_elt(result, 0)) : Rf_length(result);

    all_df *= is_df;
    all_objects *= !is_df;
    all_same_type *= sexp_type(result) == first_sexp_type_;
    all_same_size *= result_size == first_size_;

    if (collation_ == list) {
      results_sizes_[i] = 1;
    } else {
      results_sizes_[i] = result_size;
    }
  }

  int all_atomics = all_same_type && is_atomic(first_sexp_type_);

  if (all_atomics) {
    results_type_ = (all_same_size && first_size_ <= 1) ? scalars : vectors;
  } else if (all_df) {
    results_type_ = dataframes;
  } else if (all_nulls) {
    results_type_ = nulls;
  } else {
    results_type_ = objects;
  }
  
  if (collation_ != list && !(all_atomics || all_df || all_nulls)) {
    stop(".f must return either only data frames, or only objects for non-list collation");
  }

  // For cols collation, check that all elements have compatible size
  if (collation_ == cols && (results_type_ == dataframes || results_type_ == vectors)) {
    if (all_same_size)
      std::fill(results_sizes_.begin(), results_sizes_.end(), 1);
    else
      stop(".f should return equal length vectors or data frames for collating on `cols`");
  }

  if (collation_ == list) {
    n_rows_ = n_slices_;
  } else {
    n_rows_ = sum(results_sizes_);
  }

  // Find out how many output columns given collation and results type
  switch (collation_) {
  case rows:
    switch (results_type_) {
    case nulls:
    case scalars:
      n_cols_ = n_labels_ + 1;
      break;
    case vectors:
      n_cols_ = n_labels_ + 1 + !unique_labels_;
      break;
    case dataframes:
      n_cols_ = n_labels_ + Rf_length(results_[0]) + !unique_labels_;
      break;
    case objects:
      n_cols_ = n_labels_;
      break;
    }
    break;

  case cols:
    switch (results_type_) {
    case nulls:
    case scalars:
      n_cols_ = n_labels_ + 1;
      break;
    case vectors:
      n_cols_ = n_labels_ + first_size_;
      break;
    case dataframes:
      n_cols_ = n_labels_ + first_size_ * Rf_length(results_[0]);
      break;

    case objects:
      break;
    }
    break;

  case list:
    n_cols_ = n_labels_ + 1;
    break;
  }
}

inline void SlicesResults::add_labels(List& out) {
  if (n_labels_ > 0) {
#define REP_EACH_N(R_TYPE)                        \
    case R_TYPE: {                                \
      out[i] = rep_each_n(label, results_sizes_); \
      Rf_copyMostAttrib(label, out[i]);           \
      break;                                      \
    }
    for (int i = 0; i != slicing_cols_.size(); ++i) {
      RObject label = labels_[i];
      switch (sexp_type(label)) {
        REP_EACH_N(LGLSXP);
        REP_EACH_N(INTSXP);
        REP_EACH_N(REALSXP);
        REP_EACH_N(STRSXP);
        REP_EACH_N(CPLXSXP);
        REP_EACH_N(RAWSXP);
        REP_EACH_N(VECSXP);
      default: { stop("internal error: unhandled vector type in REP"); }
      }
    }
  }
}

inline RObject SlicesResults::create_column(SEXPTYPE type) {
  if (type == NILSXP) {
    return R_NilValue;
  }
  
  // Copy results' list contents to a common vector.
  // Handles all vectors, including scalar and ragged.
  RObject output_col(Rf_allocVector(type, n_rows_));
  for (int i = 0, counter = 0; i != n_slices_; ++i) {
    copy_elements(get_vector_elt(results_, i), 0, output_col, counter);
    counter += results_sizes_[i];
  }
  return output_col;
}

inline int SlicesResults::create_row_column(List& out) {
  if (!unique_labels_) {
    // Create .row column when labels are not unique (as is the case
    // when mapping rows) to link each result to the original data
    // frame row with which we invoked .f
    IntegerVector index = seq_each_n(results_sizes_);
    out[n_labels_] = index;
    return 1;
  } else {
    return 0;
  }
}

template<>
inline void SlicesResults::add_output<rows>(List& out) {
  if (results_type_ == objects) {
    stop("Cannot collate objects on rows");
  }

  switch (results_type_) {
  case vectors: {
    int offset = create_row_column(out);
    out[n_labels_ + offset] = create_column(first_sexp_type_);
    break;
  }
  case nulls:
    out[n_labels_] = R_NilValue;
  case scalars:
    out[n_labels_] = create_column(first_sexp_type_);
    break;
  case dataframes: {
    int offset = n_labels_ + create_row_column(out);
    // Fill in each column
    for (int col = 0; col < (n_cols_ - offset); ++col) {
      int type = TYPEOF(get_ij_elt(results_, col, 0));
      RObject vec(Rf_allocVector(type, n_rows_));
      for (int s = 0, counter = 0; s < n_slices_; ++s) {
        copy_elements(get_ij_elt(results_, col, s), 0, vec, counter);
        counter += results_sizes_[s];
      }
      out[col + offset] = vec;
    }
    break;
  }
  default:
    break;
  }
}

template<>
inline void SlicesResults::add_output<cols>(List& out) {
  switch (results_type_) {
  case objects:
    break;
  case nulls:
    out[n_labels_] = R_NilValue;
  case scalars:
    out[n_labels_] = create_column(first_sexp_type_);
    break;
  case vectors:
    for (int i = 0, counter = 0; i < first_size_; ++i) {
      RObject out_i(Rf_allocVector(first_sexp_type_, n_rows_));

      for (int s = 0; s < n_slices_; ++s) {
        copy_elements(results_[s], i, out_i, counter, 1);
        counter += 1;
      }
      out[n_labels_ + i] = out_i;
      counter = 0;
    }
    break;
  case dataframes:
    List first_result = results_[0];
    int n_cols_results = first_result.size();
    int n_rows_results = Rf_length(first_result[0]);

    for (int col = 0, col_counter = 0; col < n_cols_results; ++col) {
      for (int row = 0, counter = 0; row < n_rows_results; ++row) {
        SEXPTYPE type = TYPEOF(get_vector_elt(first_result, col));
        RObject out_i(Rf_allocVector(type, n_rows_));

        for (int s = 0; s < n_slices_; ++s) {
          copy_elements(get_ij_elt(results_, col, s), row, out_i, counter, 1);
          ++counter;
        }
        out[n_labels_ + col_counter] = out_i;
        counter = 0;
        ++col_counter;
      }
    }
  }
}

inline void SlicesResults::add_output(List& out) {
  switch (collation_) {
  case rows:
    add_output<rows>(out);
    break;
  case cols:
    add_output<cols>(out);
    break;
  default:
    out[n_labels_] = results_;
    break;
  }
}

template<>
inline void SlicesResults::add_colnames<rows>(List& out, std::string& output_colname,
                                              CharacterVector& out_names) {
  switch (results_type_) {
  case nulls:
  case scalars:
    out_names[n_labels_] = output_colname;
    break;
  case vectors: {
    int offset = n_labels_;
    if (!unique_labels_) {
      offset += 1;
      out_names[n_labels_] = ".row";
    }
    out_names[offset] = output_colname;
    break;
  }
  case dataframes: {
    int offset = n_labels_;
    if (!unique_labels_) {
      offset += 1;
      out_names[n_labels_] = ".row";
    }

    // If a data frame is returned in each slice, we need to check
    // that they share a common structure. Here, we check that they
    // have consistent column names
    List first_result = results_[0];
    CharacterVector first_colnames = first_result.names();

    for (int i = 0; i < n_slices_; ++i) {
      List i_result = results_[i];
      CharacterVector i_colnames = i_result.names();
      if (!R_compute_identical(first_colnames, i_colnames, 15)) {
        stop("Incompatible slice results (names do not match)");
      }
    }
    std::copy(first_colnames.begin(), first_colnames.end(), out_names.begin() + offset);
    break;
  }
  case objects:
    stop("Internal error: rows collation of objects");
    break;
  }
}

template<>
inline void SlicesResults::add_colnames<cols>(List& out, std::string& output_colname,
                                              CharacterVector& out_names) {
  switch (results_type_) {
  case nulls:
  case scalars:
    out_names[n_labels_] = output_colname;
    break;
  case vectors:
    for (int i = 0; i < first_size_; ++i) {
      out_names[n_labels_ + i] =
        output_colname + boost::lexical_cast<std::string>(i + 1);
    }
    break;
  case dataframes: {
    List first_result = results_[0];
    int n_cols_results = first_result.size();
    int n_rows_results = Rf_length(first_result[0]);
    CharacterVector names(first_result.names());

    for (int col = 0, counter = 0; col < n_cols_results; ++col) {
      for (int row = 0; row < n_rows_results; ++row) {
        out_names[n_labels_ + counter] =
          (std::string) names[col] + boost::lexical_cast<std::string>(row + 1);
        ++counter;
      }
    }
    break;
  }
  default:
    stop("Internal error: cols collation of objects");
    break;
  }
}

inline void SlicesResults::add_colnames(List& out, std::string& output_colname) {
  CharacterVector out_names = no_init(n_cols_);
  if (n_labels_ > 0) {
    CharacterVector slicing_cols_names = slicing_cols_.names();
    std::copy(slicing_cols_names.begin(), slicing_cols_names.end(), out_names.begin());
  }

  switch (collation_) {
  case rows:
    add_colnames<rows>(out, output_colname, out_names);
    break;
  case cols:
    add_colnames<cols>(out, output_colname, out_names);
    break;
  case list:
    out_names[n_labels_] = output_colname;
    break;
  }

  out.names() = out_names;
}


inline List SlicesResults::out(std::string output_colname) {
  List out = no_init(n_cols_);

  add_output(out);
  add_labels(out);
  add_colnames(out, output_colname);

  return as_data_frame(out);
}


List process_slices(List results, Environment env) {
  SlicesResults slices_results(results, env);
  CharacterVector output_colname = env[".to"];
  return slices_results.out((std::string) output_colname[0]);
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

extern "C" SEXP by_slice_impl(SEXP env, SEXP d_name_, SEXP f_name_) {
  BEGIN_RCPP
  const char* d_name = CHAR(Rf_asChar(d_name_));
  SEXP d = Rf_install(d_name);
  SEXP d_val = Rf_eval(d, env);

  // Replace x in env with a list of data frames, one for each group
  Rf_defineVar(d, subset_slices(d_val), env);

  // Map over that list
  SEXP results = PROTECT(map_impl(env, d_name_, f_name_, Rf_mkChar("list")));

  // Create the output data frame
  results = PROTECT(process_slices(results, env));

  UNPROTECT(2);
  return results;
  END_RCPP
}

extern "C" SEXP invoke_rows_impl(SEXP env, SEXP d_name_, SEXP f_name_) {
  BEGIN_RCPP
  // Map in parallel over the rows of the data frame
  SEXP results = PROTECT(pmap_impl(env, d_name_, f_name_, Rf_mkChar("list")));

  // Create the output data frame
  results = PROTECT(process_slices(results, env));

  UNPROTECT(2);
  return results;
  END_RCPP
}
