#' @title Shape
#' @description
#' Get the shape of a tensor.
#' @param x (any)\cr
#'   Object.
#' @param ... (any)\cr
#'   Additional arguments.
#' @return (`integer()`)\cr
#'   The shape of the tensor.
#' @export
shape <- S7::new_generic("shape", "x", function(x, ...) {
  S7::S7_dispatch()
})

#' @title Data Type
#' @description
#' Get the data type of a tensor.
#' The return type depends on the specific tensor implementation.
#' @param x (any)\cr
#'   Object.
#' @param ... (any)\cr
#'   Additional arguments.
#' @return (any)
#' @export
dtype <- S7::new_generic("dtype", "x", function(x, ...) {
  S7::S7_dispatch()
})
