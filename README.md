
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tengen

<!-- badges: start -->

[![R-CMD-check](https://github.com/r-xla/tengen/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/r-xla/tengen/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Provides S7 generics for common tensor operations.

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
