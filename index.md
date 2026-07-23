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
- [`axes()`](https://r-xla.github.io/tengen/reference/axes.md): Returns
  the axis indices of the tensor. Is implemented as `seq_len(naxes(x))`.
- [`nelts()`](https://r-xla.github.io/tengen/reference/nelts.md):
  Returns the number of elements of the tensor. Is implemented as
  `prod(shape(x))`.

## Tensor Data Types

tengen provides an S3 class hierarchy for representing tensor data types
via `DataType`:

- `BooleanType()` - Boolean (`i1` / `pred` / `bool`)
- `IntegerType(bits)` - Signed integers (`i8`, `i16`, `i32`, `i64`)
- `UIntegerType(bits)` - Unsigned integers (`ui8`, `ui16`, `ui32`,
  `ui64`)
- `FloatType(bits)` - Floating point (`f32`, `f64`)

Utility functions:

- `as_dtype(x)`: Convert a string (e.g. `"f32"`) or `DataType` to a
  `DataType` object.
- `is_dtype(x)`: Check whether an object is a `DataType`.
- `assert_dtype(x)`: Assert that an object is a `DataType`.

Data types support equality comparison with `==` and `!=`.
