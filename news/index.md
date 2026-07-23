# Changelog

## tengen (development version)

- breaking: the `DataType` hierarchy (`BooleanType()`, `IntegerType()`,
  `UIntegerType()`, `FloatType()`) is replaced by a single enum-style
  `DataType` (adds `f16`, `bf16`, and `c64`/`c128`). Construct dtypes
  with
  [`as_dtype()`](https://r-xla.github.io/tengen/reference/as_dtype.md).
- new:
  [`dtype_width()`](https://r-xla.github.io/tengen/reference/dtype_width.md),
  [`is_dtype_float()`](https://r-xla.github.io/tengen/reference/is_dtype_float.md),
  [`is_dtype_int()`](https://r-xla.github.io/tengen/reference/is_dtype_float.md),
  [`is_dtype_uint()`](https://r-xla.github.io/tengen/reference/is_dtype_float.md),
  [`is_dtype_bool()`](https://r-xla.github.io/tengen/reference/is_dtype_float.md),
  [`is_dtype_complex()`](https://r-xla.github.io/tengen/reference/is_dtype_float.md).
- Renamed `ndims()` to
  [`naxes()`](https://r-xla.github.io/tengen/reference/naxes.md).
- Added `axes()` returning the axis indices of a tensor,
  i.e. `seq_len(naxes(x))`.

## tengen 0.2.0

- Added the `DataType` class hierarchy: `BooleanType`, `IntegerType`,
  `UIntegerType`, and `FloatType` with `==`/`!=` comparison,
  [`print()`](https://rdrr.io/r/base/print.html), and
  [`as.character()`](https://rdrr.io/r/base/character.html) methods.
- Added
  [`as_dtype()`](https://r-xla.github.io/tengen/reference/as_dtype.md)
  generic to convert strings (e.g. `"i32"`, `"f64"`) to `DataType`
  objects.
- Added
  [`is_dtype()`](https://r-xla.github.io/tengen/reference/is_dtype.md)
  and
  [`assert_dtype()`](https://r-xla.github.io/tengen/reference/assert_dtype.md)
  helpers for type checking.
- Added [`nelts()`](https://r-xla.github.io/tengen/reference/nelts.md)
  generic to get the number of elements of a tensor.
- Renamed `TensorDataType` to `DataType`.

## tengen 0.1.0

- Initial release on r-universe
