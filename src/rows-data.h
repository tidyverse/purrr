#ifndef ROWSDATA_H
#define ROWSDATA_H

using namespace Rcpp;
namespace rows {


enum SlicesType {
  scalars,
  vectors,
  dataframes,
  nulls,
  objects
};

enum CollationType {
  rows,
  cols,
  list
};


struct Settings {
 public:
  CollationType collation;
  std::string output_colname;
  int include_labels;

  Settings(Environment execution_env_);
};


struct Labels {
 public:
  int are_unique;
  List slicing_cols;

  List get() const { return labels_; }
  int size() const { return n_labels_; }
  void remove(const std::vector<int>& index);

  Labels(Environment execution_env_);

 private:
  List labels_;
  int n_labels_;
};


struct Results {
 public:
  List results;
  int n_slices;
  SlicesType type;

  int first_sexp_type, first_size;
  IntegerVector sizes;
  int equi_sized;
  std::vector<int> empty_index;

  List get() { return results; }
  int size() { return n_slices; }
  Results(List raw_results_, int remove_empty_);

 private:
  int all_nulls_;

  void determine_first_result_properties();
  void init_first_result_nonnull();
  void determine_null_properties();
  void determine_results_properties();

  void remove_empty_results();
  void set_result_size(int index, int size);
};


} // namespace rows

#endif
