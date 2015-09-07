#include <Rcpp.h>
#include <dplyr.h>
#include "utils.h"
#include "fast-copy.h"

using namespace Rcpp;


SEXP subset_slices(const List& data) {
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


SEXP get_slice_col(const SEXP slice, int slice_i, int col_i) {
  return get_vector_elt(get_vector_elt(slice, slice_i), col_i);
}


// [[Rcpp::export]]
SEXP process_slices(List& results, const List& slicers,
                    const List& labels, int include_labels,
                    int row_id = 0) {
  int n_slices = results.size();
  int n_slicers = slicers.size();


  // Wrap non-list objects in a list. Make a list-column only if all
  // outputs are not data frames. In all other cases, we let
  // dplyr::bind_rows() check that the outputs are compatible. If
  // results are all same atomic type, we'll save them in a regular
  // new column
  IntegerVector res_sizes = no_init(n_slices);
  int atomic_type = TYPEOF(results[0]);
  int all_df = 1;
  int all_objects = 1;
  int all_same_type = 1;
  int all_size_one = 1;

  for (int i = 0; i != n_slices; ++i) {
    SEXP result = results[i];
    int is_df = Rf_inherits(result, "data.frame");
    all_df *= is_df;
    all_objects *= !is_df;
    all_same_type *= TYPEOF(result) == atomic_type;
    all_size_one *= Rf_length(results[i]) == 1;

    if (is_df) {
      res_sizes[i] = Rf_length(VECTOR_ELT(results[i], 0));
    } else if (is_atomic(result)) {
      res_sizes[i] = Rf_length(results[i]);
    } else {
      res_sizes[i] = 1;
    }
  }

  int all_atomics = all_same_type && is_atomic(atomic_type);
  if (!(all_objects || all_atomics) && !all_df) {
    stop("..f must return either only data frames, or only objects");
  }

  int n_rows;
  n_rows = sum(res_sizes);

  int cols_offset = include_labels ? n_slicers : 0;
  int n_cols = cols_offset;
  if (all_df) {
    n_cols += Rf_length(results[0]);
  } else {
    n_cols += 1;
  }

  // With by_row() and map_rows(), include_labels rows might not be
  // unique. So create .row identifier column if output is length > 1
  if (row_id && !all_size_one) {
    n_cols += 1;
  }


  List out = no_init(n_cols);

  // Prepare output names
  CharacterVector slicers_names = slicers.names();
  CharacterVector out_names = no_init(n_cols);
  if (include_labels) {
    std::copy(slicers_names.begin(), slicers_names.end(), out_names.begin());
  }


  // Fast routine for duplicating slicers if include_labels is
  // requested.  Adapted from reshape's code.
  if (include_labels) {
#define REP_EACH_N(R_TYPE)                       \
    case R_TYPE: {                               \
      out[i] = rep_each_n(labels[i], res_sizes); \
      Rf_copyMostAttrib(labels[i], out[i]);      \
      break;                                     \
    }

    for (int i = 0; i != n_slicers; ++i) {
      switch (TYPEOF(labels[i])) {
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


  // Now, prepare actual output. Simply return the list-column when
  // results are not data frames, and coerce atomic vectors to new
  // data frame column.

  if (all_atomics) {
    Shield<SEXP> to(Rf_allocVector(atomic_type, n_rows));
    for (int i = 0, counter = 0; i != n_slices; ++i) {
      copy_at_pos(get_vector_elt(results, i), to, counter);
      counter += res_sizes[i];
    }

    if (row_id && !all_size_one) {
      // Add an index column for by row mapping
      Shield<SEXP> index(seq_each_n(results.size(), res_sizes));
      out[cols_offset] = index;
      out[cols_offset + 1] = to;
      out_names[cols_offset] = ".row";
      out_names[cols_offset + 1] = ".out";
    } else {
      out[cols_offset] = to;
      out_names[cols_offset] = ".out";
    }

  } else if (all_objects) {
    out[cols_offset] = results;
    out_names[cols_offset] = ".out";

  } else {
    // Check names consistency of slices of data frames
    typedef std::vector<std::string> strings;
    strings res_colnames = Rcpp::as<strings>(Rf_getAttrib(results[0], R_NamesSymbol));

    for (int i = 0; i != n_slices; ++i) {
      strings other_colnames = Rcpp::as<strings>(Rf_getAttrib(results[i], R_NamesSymbol));
      if (res_colnames != other_colnames) {
        stop("Incompatible slice results (names do not match)");
      }
    }
    std::copy(res_colnames.begin(), res_colnames.end(), out_names.begin() + cols_offset);

    // Fill in each column with a fast memcpy routine
    for (int i = 0; i != n_cols - cols_offset; ++i) {
      Shield<SEXP> to(Rf_allocVector(TYPEOF(get_slice_col(results, 0, i)), n_rows));
      for (int j = 0, counter = 0; j != n_slices; ++j) {
        copy_at_pos(get_slice_col(results, j, i), to, counter);
        counter += res_sizes[j];
      }
      out[i + cols_offset] = to;
    }
  }

  out.names() = out_names;
  return as_data_frame(out);
}


// [[Rcpp::export]]
SEXP by_slice_impl(const List& data, const SEXP fun, SEXP dots,
                   int include_labels, const Environment& calling_env) {
  ListOf<Symbol> slicers_symbols(data.attr("vars"));
  int n_slicers(slicers_symbols.size());

  CharacterVector slicers_names(n_slicers);
  for (int i = 0; i != n_slicers; ++i) {
    slicers_names[i] = slicers_symbols[i].c_str();
  }
  CharacterVector col_names = data.attr("names");


  // Evaluating a R call from C/Rcpp causes a language inlining of all
  // arguments. This has a performance cost in some situations
  // involving match.call(), and maybe in other cases as well. To
  // avoid those, we store the slice in an environment.
  Environment shadow_env(calling_env);
  SET_TYPEOF(dots, LANGSXP);
  dots = CDR(dots);  // car is the list that was used to capture dots
  Shield<SEXP> lang_call(Rf_lcons(fun, Rf_lcons(Rf_install("shadowed"), dots)));


  // Remove slicing variables before subsetting rows
  List results = subset_slices(data[!in(col_names, slicers_names)]);

  for (int i = 0; i < results.size(); ++i) {
    shadow_env.assign("shadowed", results[i]);
    results[i] = Rf_eval(lang_call, shadow_env);
  }

  return process_slices(results, data[slicers_names],
                        data.attr("labels"), include_labels);
}


// [[Rcpp::export]]
SEXP by_row_impl(const List& data, const SEXP fun, SEXP dots,
                 int include_labels, const Environment& calling_env) {

  // Shadow the argument in an environment and construct a call
  Environment shadow_env(calling_env);
  SET_TYPEOF(dots, LANGSXP);
  dots = CDR(dots);
  Shield<SEXP> lang_call(Rf_lcons(fun, Rf_lcons(Rf_install("shadowed"), dots)));

  int n_rows = Rf_length(data[0]);
  dplyr::DataFrameSubsetVisitors visitors(data);
  CharacterVector classes = CharacterVector::create("tbl_df", "data.frame");
  List results(n_rows);

  for (int i = 0; i < n_rows; ++i) {
    SEXP row = visitors.subset(IntegerVector::create(i), classes);
    shadow_env.assign("shadowed", row);
    results[i] = Rf_eval(lang_call, shadow_env);
  }

  return process_slices(results, data, data, include_labels, 1);
}
