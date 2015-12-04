#ifndef ROWSFORMATTER_H
#define ROWSFORMATTER_H

namespace Slices {


class Formatter;
typedef std::unique_ptr<Formatter> FormatterPtr;

class Formatter {
protected:
  Labels& labels_;
  Results& results_;
  Settings& settings_;

  int n_rows_, n_cols_;
  int labels_size();

  virtual void check_nonlist_consistency();

  void determine_nrows();
  void determine_ncols();
  void determine_dimensions();

  int should_include_rowid_column();
  int create_rowid_column(List& out);
  void add_labels(List& out);
  virtual int output_size() = 0;
  RObject create_column(SEXPTYPE type);

  virtual void add_output(List& out) = 0;
  void add_colnames(List& out);
  virtual CharacterVector& create_colnames(CharacterVector& out_names) = 0;

public:
  Formatter(Results& results, Labels& labels, Settings& settings)
      : results_(results),
        labels_(labels),
        settings_(settings) { }

  List output();
  static FormatterPtr create(Results& results, Labels& labels, Settings& settings);
};


class RowsFormatter : public Formatter {
  int output_size();
  void add_output(List& out);
  void rows_bind_dataframes(List& out);
  void rows_bind_vectors(List& out);
  void add_rows_binded_vectors_colnames(CharacterVector& out_names);
  void add_rows_binded_dataframes_colnames(CharacterVector& out_names);
  CharacterVector& create_colnames(CharacterVector& out_names);
public:
  RowsFormatter(Results& results, Labels& labels, Settings& settings)
      : Formatter(results, labels, settings) {
    check_nonlist_consistency();
  }
};

class ColsFormatter : public Formatter {
  void check_nonlist_consistency();
  void adjust_results_sizes();
  int output_size();
  void add_output(List& out);
  void cols_bind_dataframes(List& out);
  void cols_bind_vectors(List& out);
  void add_cols_binded_vectors_colnames(CharacterVector& out_names);
  void add_cols_binded_dataframes_colnames(CharacterVector& out_names);
  CharacterVector& create_colnames(CharacterVector& out_names);
public:
  ColsFormatter(Results& results, Labels& labels, Settings& settings)
      : Formatter(results, labels, settings) {
    check_nonlist_consistency();
    adjust_results_sizes();
  }
};

class ListFormatter : public Formatter {
  void adjust_results_sizes();
  int output_size();
  CharacterVector& create_colnames(CharacterVector& out_names);
  void add_output(List& out);
public:
  ListFormatter(Results& results, Labels& labels, Settings& settings)
      : Formatter(results, labels, settings) {
    adjust_results_sizes();
  }
};


} // namespace Slices

#endif
