# tengen (development version)

* Renamed `ndims()` to `naxes()`.
* Added `axes()` returning the axis indices of a tensor, i.e. `seq_len(naxes(x))`.

# tengen 0.2.0

* Added the `DataType` class hierarchy: `BooleanType`, `IntegerType`,
  `UIntegerType`, and `FloatType` with `==`/`!=` comparison, `print()`,
  and `as.character()` methods.
* Added `as_dtype()` generic to convert strings (e.g. `"i32"`, `"f64"`) to
  `DataType` objects.
* Added `is_dtype()` and `assert_dtype()` helpers for type checking.
* Added `nelts()` generic to get the number of elements of a tensor.
* Renamed `TensorDataType` to `DataType`.

# tengen 0.1.0

* Initial release on r-universe
