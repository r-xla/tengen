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

#' @title Device
#' @description
#' Get the device of a tensor.
#' @param x (any)\cr
#'   Object.
#' @param ... (any)\cr
#'   Additional arguments.
#' @return (any)
#' @export
device <- S7::new_generic("device", "x", function(x, ...) {
  S7::S7_dispatch()
})

#' @title As Array
#' @description
#' Convert a value (usually a tensor from some framework) to an R array.
#' @param x (any)\cr
#'   Object.
#' @param ... (any)\cr
#'   Additional arguments.
#' @return (any)
#' @export
as_array <- S7::new_generic("as_array", "x", function(x, ...) {
  S7::S7_dispatch()
})


#' @title As Ray
#' @description
#' Convert a value (usually a tensor from some framework) to a `raw()` vector.
#' @param x (any)\cr
#'   Object.
#' @param ... (any)\cr
#'   Additional arguments.
#' @return (any)
#' @export
as_raw <- S7::new_generic("as_raw", "x", function(x, ...) {
  S7::S7_dispatch()
})

#' @title Number of Dimensions
#' @description
#' Get the number of dimensions of a tensor.
#' @param x (any)\cr
#'   Object.
#' @return (integer)
#' @export
ndims <- function(x) {
  length(shape(x))
}

class_array <- S7::new_S3_class("array")

# Somehow I can't define a method for new_S3_class("array"), so
# using this as a workaround

shape_union <- S7::class_numeric | S7::class_logical | S7::class_character | S7::class_raw | S7::class_complex

S7::method(shape, shape_union) <- function(x) {
  if (is.array(x)) {
    return(dim(x))
  }
  stop("shape not supported for class ", class(x)[1])
}
