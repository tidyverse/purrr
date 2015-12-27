#ifndef ROWSFORMATTER_H
#define ROWSFORMATTER_H

#include <boost/shared_ptr.hpp>

namespace rows {


class Formatter;
typedef boost::shared_ptr<Formatter> FormatterPtr;

class Formatter {
 public:
  Formatter(Results& results, Labels& labels, Settings& settings)
      : results_(results),
        labels_(labels),
        settings_(settings) { }
  static FormatterPtr create(Results& results, Labels& labels, Settings& settings);
  List output();

 protected:
  Labels& labels_;
  Results& results_;
  Settings& settings_;

  int n_rows_, n_cols_;
  int labels_size();

  virtual void check_nonlist_consistency();

  int determine_nrows();
  int determine_ncols();
  void determine_dimensions();

  int should_include_rowid_column();
  List& maybe_create_rowid_column(List& out);
  List& add_labels(List& out);
  virtual int output_size() = 0;
  RObject create_column(SEXPTYPE type);

  virtual List& add_output(List& out) = 0;
  List& add_colnames(List& out);
  virtual CharacterVector& create_colnames(CharacterVector& out_names) = 0;
};


class RowsFormatter : public Formatter {
 public:
  RowsFormatter(Results& results, Labels& labels, Settings& settings)
      : Formatter(results, labels, settings) {
    check_nonlist_consistency();
  }

 private:
  int output_size();
  List& add_output(List& out);
  List& rows_bind_dataframes(List& out);
  List& rows_bind_vectors(List& out);
  CharacterVector& add_rows_binded_vectors_colnames(CharacterVector& out_names);
  CharacterVector& add_rows_binded_dataframes_colnames(CharacterVector& out_names);
  CharacterVector& create_colnames(CharacterVector& out_names);
};

class ColsFormatter : public Formatter {
 public:
  ColsFormatter(Results& results, Labels& labels, Settings& settings)
      : Formatter(results, labels, settings) {
    check_nonlist_consistency();
    adjust_results_sizes();
  }

 private:
  void check_nonlist_consistency();
  void adjust_results_sizes();
  int output_size();
  List& add_output(List& out);
  List& cols_bind_dataframes(List& out);
  List& cols_bind_vectors(List& out);
  CharacterVector& add_cols_binded_vectors_colnames(CharacterVector& out_names);
  CharacterVector& add_cols_binded_dataframes_colnames(CharacterVector& out_names);
  CharacterVector& create_colnames(CharacterVector& out_names);
};

class ListFormatter : public Formatter {
 public:
  ListFormatter(Results& results, Labels& labels, Settings& settings)
      : Formatter(results, labels, settings) {
    adjust_results_sizes();
  }

 private:
  void adjust_results_sizes();
  int output_size();
  CharacterVector& create_colnames(CharacterVector& out_names);
  List& add_output(List& out);
};


} // namespace rows

#endif
