# tengen 0.3.0

* breaking: the `DataType` hierarchy (`BooleanType()`, `IntegerType()`,
  `UIntegerType()`, `FloatType()`) is replaced by a single enum-style
  `DataType` (adds `f16`, `bf16`, and `c64`/`c128`). Construct dtypes
  with `as_dtype()`.
* new: `dtype_bits()`, `is_dtype_float()`, `is_dtype_int()`,
  `is_dtype_uint()`, `is_dtype_bool()`, `is_dtype_complex()`.
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
