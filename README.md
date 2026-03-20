
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tengen

<!-- badges: start -->

[![R-CMD-check](https://github.com/r-xla/tengen/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/r-xla/tengen/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Provides S3 generics for common tensor operations.

## Installation

``` r
pak::pak("r-xla/tengen")
```

## Available Generics

- `shape()`: Different from `dim()` by also supporting 0-dimensional
  tensors.
- `dtype()`: Returns the data type of the tensor.
- `as_array()`: Converts the tensor to an R array.
- `as_raw()`: Converts the tensor to a `raw()` vector.
- `device()`: Returns the device of the tensor.

Other functions:

- `ndims()`: Returns the number of dimensions of the tensor. Is
  implemented as `length(shape(x))`.
- `nelts()`: Returns the number of elements of the tensor. Is
  implemented as `prod(shape(x))`.

## Tensor Data Types

tengen provides an S3 class hierarchy for representing tensor data types
via `TensorDataType`:

- `BooleanType()` - Boolean (`i1` / `pred` / `bool`)
- `IntegerType(bits)` - Signed integers (`i8`, `i16`, `i32`, `i64`)
- `UIntegerType(bits)` - Unsigned integers (`ui8`, `ui16`, `ui32`,
  `ui64`)
- `FloatType(bits)` - Floating point (`f32`, `f64`)

Utility functions:

- `as_dtype(x)`: Convert a string (e.g. `"f32"`) or `TensorDataType` to
  a `TensorDataType` object.
- `is_dtype(x)`: Check whether an object is a `TensorDataType`.
- `assert_dtype(x)`: Assert that an object is a `TensorDataType`.

Data types support equality comparison with `==` and `!=`.
