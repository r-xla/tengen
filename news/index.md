# Changelog

## tengen (development version)

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
