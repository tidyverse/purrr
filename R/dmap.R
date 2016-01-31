#' Map over the columns of a data frame
#'
#' \code{dmap()} is just like \code{\link{map}()} but always returns a
#' data frame. In addition, it handles grouped or sliced data frames.
#'
#' \code{dmap_at()} and \code{dmap_if()} recycle length 1 vectors to
#' the group sizes.
#' @inheritParams map
#' @inheritParams as_function
#' @inheritParams conditional-map
#' @param .d A data frame.
#' @export
#' @examples
#' # dmap() always returns a data frame:
#' dmap(mtcars, summary)
#'
#' # dmap() also supports sliced data frames:
#' sliced_df <- mtcars[1:5] %>% slice_rows("cyl")
#' sliced_df %>% dmap(mean)
#' sliced_df %>% dmap(~ .x / max(.x))
#'
#' # This is equivalent to the combination of by_slice() and dmap()
#' # with 'rows' collation of results:
#' sliced_df %>% by_slice(dmap, mean, .collate = "rows")
dmap <- function(.d, .f, ...) {
  .f <- as_function(.f, ...)
  if (dplyr::is.grouped_df(.d)) {
    sliced_dmap(.d, .f, ...)
  } else {
    res <- .Call(map_impl, environment(), ".d", ".f", "list")
    dplyr::as_data_frame(res)
  }
}

sliced_dmap <- function(.d, .f, ...) {
  if (length(.d) <= length(attr(.d, "labels"))) {
    .d
  } else {
    set_sliced_env(.d, TRUE, "rows", "", environment(), ".d")
    .Call(map_by_slice_impl, environment(), ".d", ".f")
  }
}


#' @rdname dmap
#' @export
dmap_at <- function(.d, .at, .f, ...) {
  sel <- inv_which(.d, .at)
  partial_dmap(.d, sel, .f, ...)
}

#' @rdname dmap
#' @export
dmap_if <- function(.d, .p, .f, ...) {
  sel <- map_lgl(.d, .p)
  partial_dmap(.d, sel, .f, ...)
}

partial_dmap <- function(.d, .sel, .f, ...) {
  subset <- structure(.d[.sel],
    indices = attr(.d, "indices"),
    class = class(.d)
  )

  res <- dmap(subset, .f, ...)
  res <- dmap_recycle(res, .d)
  .d[.sel] <- res

  .d
}

dmap_recycle <- function(res, d) {
  if (dplyr::is.grouped_df(d)) {
    res <- dmap_recycle_sliced(res, d)
  } else {
    dmap_check_unsliced(res, d)
  }

  res
}

dmap_recycle_sliced <- function(res, d) {
  if (nrow(res) == nrow(d)) {
    return(res)
  }

  if (nrow(attr(d, "labels")) == nrow(res)) {
    sizes <- attr(d, "group_sizes")
    indices <- map2(seq_len(nrow(res)), sizes, ~rep(.x, each = .y))
    res <- res[flatten_int(indices), ]
    return(res)
  }

  stop("dmap() only recycles vectors of length 1")
}

dmap_check_unsliced <- function(res, d) {
  if (!nrow(res) %in% c(1, nrow(d))) {
    stop("dmap() only recycles vectors of length 1")
  }
}
