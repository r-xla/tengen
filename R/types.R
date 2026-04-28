#' @import checkmate
#' @importFrom cli cli_abort
NULL

#' DataType Base Class
#'
#' @description
#' `DataType` is the parent S3 class for all tensor data types.
#' All data type classes inherit from `DataType`, enabling cross-type
#' comparisons with `==` and `!=` operators.
#'
#' The specific data type classes are:
#' - [BooleanType()] - Boolean (i1)
#' - [IntegerType()] - Signed integers (i8, i16, i32, i64)
#' - [UIntegerType()] - Unsigned integers (ui8, ui16, ui32, ui64)
#' - [FloatType()] - Floating point (f32, f64)
#' - [ComplexType()] - Complex floating point (c64, c128)
#'
#' @details
#' This is a virtual base class - you cannot create instances directly.
#' Use the specific type constructors instead.
#'
#' @seealso [BooleanType()], [IntegerType()], [UIntegerType()], [FloatType()],
#'   [ComplexType()]
#' @name DataType
NULL

#' @export
`==.DataType` <- function(e1, e2) {
  if (is.character(e1)) {
    e1 <- as_dtype(e1)
  }
  if (is.character(e2)) {
    e2 <- as_dtype(e2)
  }

  # If classes don't match, types are not equal
  if (!identical(class(e1)[1], class(e2)[1])) {
    return(FALSE)
  }

  # BooleanType has no value field
  if (inherits(e1, "BooleanType")) {
    return(TRUE)
  }

  # For IntegerType, UIntegerType, FloatType - compare values
  identical(e1$value, e2$value)
}

#' @exportS3Method cli::cli_format
cli_format.DataType <- function(x, style = NULL, ...) {
  as.character(x)
}

#' @export
`!=.DataType` <- function(e1, e2) {
  !(e1 == e2) # nolint
}

#' @title BooleanType
#' @description
#' Represents the boolean type.
#' @return `BooleanType`
#' @export
BooleanType <- function() {
  structure(list(), class = c("BooleanType", "DataType"))
}

#' @export
print.DataType <- function(x, ...) {
  cat("<", as.character(x), ">\n", sep = "")
  invisible(x)
}

#' @title IntegerType (signed)
#' @description
#' Represents a signed integer type with a given bit width.
#' @param value (`integer(1)`)
#' @return `IntegerType`
#' @export
IntegerType <- function(value) {
  value <- as.integer(value)
  checkmate::assert_int(value)
  if (!(value %in% c(8L, 16L, 32L, 64L))) {
    cli_abort("Unsupported signed integer bit width: {value}")
  }

  structure(
    list(value = value),
    class = c("IntegerType", "DataType")
  )
}

#' @title UIntegerType
#' @description
#' Represents an unsigned integer type with a given bit width.
#' @param value (`integer(1)`)
#' @return `UIntegerType`
#' @export
UIntegerType <- function(value) {
  value <- as.integer(value)
  checkmate::assert_int(value)
  if (!(value %in% c(8L, 16L, 32L, 64L))) {
    cli_abort("Unsupported unsigned integer bit width: {value}")
  }

  structure(
    list(value = value),
    class = c("UIntegerType", "DataType")
  )
}

#' @title FloatType
#' @description
#' Represents a floating point type with a given bit width.
#' @param value (`integer(1)`)
#' @return `FloatType`
#' @export
FloatType <- function(value) {
  value <- as.integer(value)
  checkmate::assert_int(value)
  if (!(value %in% c(32L, 64L))) {
    cli_abort("Unsupported float bit width: {value}")
  }

  structure(
    list(value = value),
    class = c("FloatType", "DataType")
  )
}

#' @title ComplexType
#' @description
#' Represents a complex floating point type. The `value` argument is the bit
#' width of the underlying real component (i.e. `32` for `complex<f32>` /
#' `c64`, and `64` for `complex<f64>` / `c128`).
#' @param value (`integer(1)`)\cr
#'   Bit width of the underlying floating point component (`32` or `64`).
#' @return `ComplexType`
#' @export
ComplexType <- function(value) {
  value <- as.integer(value)
  checkmate::assert_int(value)
  if (!(value %in% c(32L, 64L))) {
    cli_abort("Unsupported complex bit width: {value}")
  }

  structure(
    list(value = value),
    class = c("ComplexType", "DataType")
  )
}

#' @export
as.character.BooleanType <- function(x, ...) {
  "bool"
}

#' @export
as.character.IntegerType <- function(x, ...) {
  paste0("i", x$value)
}

#' @export
as.character.UIntegerType <- function(x, ...) {
  paste0("ui", x$value)
}

#' @export
as.character.FloatType <- function(x, ...) {
  paste0("f", x$value)
}

#' @export
as.character.ComplexType <- function(x, ...) {
  # 32-bit real -> c64 (paired f32), 64-bit real -> c128 (paired f64)
  paste0("c", 2L * x$value)
}

#' @title Is DataType
#' @description
#' Check if an object is a [`DataType`].
#' @param x (any)\cr
#'   Object to check.
#' @return `logical(1)`
#' @export
is_dtype <- function(x) {
  inherits(x, "DataType")
}

#' @title Assert DataType
#' @description
#' Assert that an object is a [`DataType`].
#' @param x (any)\cr
#'   Object to check.
#' @param arg (`character(1)`)\cr
#'   Argument name for error messages.
#' @return `NULL` (invisibly). Called for side effects.
#' @export
assert_dtype <- function(x, arg = rlang::caller_arg(x)) {
  if (!is_dtype(x)) {
    cli_abort(
      "{.arg {arg}} must be a DataType (BooleanType, IntegerType, UIntegerType, FloatType, or ComplexType)"
    )
  }
}

#' @title Convert to DataType
#' @description
#' Convert to DataType.
#' @param x (any)\cr
#'   Object to convert.
#'   Can currently be a string (e.g. `"i1"`, `"i32"`, `"f32"`, ...) or a [`DataType`] object.
#' @return `DataType`
#' @export
as_dtype <- function(x) {
  UseMethod("as_dtype")
}

#' @export
as_dtype.default <- function(x) {
  cli_abort("Cannot convert {.cls {class(x)[1]}} to DataType")
}

#' @export
as_dtype.DataType <- function(x) {
  x
}

dtype_map <- list(
  "pred" = BooleanType(),
  "bool" = BooleanType(),
  "i1" = BooleanType(),
  "i8" = IntegerType(8L),
  "i16" = IntegerType(16L),
  "i32" = IntegerType(32L),
  "i64" = IntegerType(64L),
  "ui8" = UIntegerType(8L),
  "ui16" = UIntegerType(16L),
  "ui32" = UIntegerType(32L),
  "ui64" = UIntegerType(64L),
  "f32" = FloatType(32L),
  "f64" = FloatType(64L),
  "c64" = ComplexType(32L),
  "c128" = ComplexType(64L)
)

#' @export
as_dtype.character <- function(x) {
  dtype_map[[x]] %??% cli_abort("Unsupported dtype: {x}")
}
