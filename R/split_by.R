#' split_by
#'
#' An alternative to [base::split.data.frame()] with the following differences:
#' + it operates on bare symbols (like dplyr verbs)
#' + if splitting on multiple variables, it does not include missing combinations
#'   not present in the data (equivelatnt to `drop = TRUE` in
#'   [base::split.data.frame()])
#'
#' This funciton is powerful in combination with [map_dfr()].
#'
#' @param data a dataframe or tibble
#' @param ... bare symbols for columns names in `data` to use for splitting.
#'   Passed on to `dplyr::group_by()`
#' @param sep If splitting with multiple variables, sep is used to create names.
#'
#' @return a named list of dataframes
#' @export
#'
#' @examples
#' split_by(mtcars, cyl)
#' split_by(mtcars, cyl, gear)
#' if(require(dplyr))
#'   split_by(mtcars, row_number())
#'
#' if (require(ggplot2)) {
#'   split_by(mpg, manufacturer)
#'   split_by(mpg, manufacturer, class)
#' }
split_by <- function(data, ..., sep = ".") {
  if (!is_installed("dplyr")) {
    abort("`map_df()` requires dplyr")
  }

  data <- dplyr::group_by(data, ..., add = FALSE)

  out <- split.data.frame(dplyr::ungroup(data), dplyr::group_indices(data))

  vars_chr <- dplyr::group_vars(data)
  names(out) <- map_chr(out, function(df)
    do.call(paste, c(as.data.frame(df)[1L, vars_chr, drop = FALSE], sep = sep)))
  # as.data.frame() is called to drop any additional columns that classes built
  # on top of data.frame might enforce, like package:sf simple features which
  # always retains a geometry column
  out
}

