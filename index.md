# tengen

Provides S3 generics for common tensor operations.

## Installation

``` r

pak::pak("r-xla/tengen")
```

## Available Generics

- [`shape()`](https://r-xla.github.io/tengen/reference/shape.md):
  Different from [`dim()`](https://rdrr.io/r/base/dim.html) by also
  supporting 0-dimensional tensors.
- [`dtype()`](https://r-xla.github.io/tengen/reference/dtype.md):
  Returns the data type of the tensor.
- [`as_array()`](https://r-xla.github.io/tengen/reference/as_array.md):
  Converts the tensor to an R array.
- [`as_raw()`](https://r-xla.github.io/tengen/reference/as_raw.md):
  Converts the tensor to a [`raw()`](https://rdrr.io/r/base/raw.html)
  vector.
- [`device()`](https://r-xla.github.io/tengen/reference/device.md):
  Returns the device of the tensor.

Other functions:

- [`naxes()`](https://r-xla.github.io/tengen/reference/naxes.md):
  Returns the number of axes of the tensor. Is implemented as
  `length(shape(x))`.
- [`nelts()`](https://r-xla.github.io/tengen/reference/nelts.md):
  Returns the number of elements of the tensor. Is implemented as
  `prod(shape(x))`.

## Tensor Data Types

tengen provides `DataType`, an enum-style S3 class representing a tensor
element type. There is one singleton object per supported dtype,
wrapping its canonical string. The members are:

- boolean: `bool` (aliases `i1`, `pred`)
- signed integers: `i8`, `i16`, `i32`, `i64`
- unsigned integers: `ui8`, `ui16`, `ui32`, `ui64`
- floats: `f16`, `bf16`, `f32`, `f64`
- complex: `c64`, `c128`

Construct and inspect data types with:

- `as_dtype(x)`: Convert a string (e.g. `"f32"`) or `DataType` to a
  `DataType` object.
- `is_dtype(x)`: Check whether an object is a `DataType`.
- `assert_dtype(x)`: Assert that an object is a `DataType`.
- `dtype_width(x)`: The width of one element in bits.
- `dtype_category(x)`: The category, one of `"bool"`, `"int"`, `"uint"`,
  `"float"`, or `"complex"`.
- `is_dtype_float(x)`, `is_dtype_int(x)`, `is_dtype_uint(x)`,
  `is_dtype_bool(x)`, `is_dtype_complex(x)`: Per-category predicates.

Data types support equality comparison with `==` and `!=`.
