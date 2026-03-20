test_that("dtype constructors work", {
  expect_s3_class(BooleanType(), "TensorDataType")
  expect_s3_class(IntegerType(32), "TensorDataType")
  expect_s3_class(UIntegerType(8), "TensorDataType")
  expect_s3_class(FloatType(32), "TensorDataType")
})

test_that("TensorDataType equality", {
  expect_true(BooleanType() == BooleanType())
  expect_false(BooleanType() != BooleanType())

  expect_true(IntegerType(32) == IntegerType(32))
  expect_false(IntegerType(32) != IntegerType(32))
  expect_false(IntegerType(32) == IntegerType(64))
  expect_true(IntegerType(32) != IntegerType(64))

  expect_true(UIntegerType(32) == UIntegerType(32))
  expect_false(UIntegerType(32) != UIntegerType(32))
  expect_false(UIntegerType(32) == UIntegerType(64))
  expect_true(UIntegerType(32) != UIntegerType(64))

  expect_true(FloatType(32) == FloatType(32))
  expect_false(FloatType(32) != FloatType(32))
  expect_false(FloatType(32) == FloatType(64))
  expect_true(FloatType(32) != FloatType(64))

  expect_false(IntegerType(32) == FloatType(32))
  expect_true(IntegerType(32) != FloatType(32))
  expect_false(BooleanType() == IntegerType(32))
})

test_that("TensorDataType comparison with character", {
  expect_true(FloatType(32) == "f32")
  expect_true("f32" == FloatType(32))
  expect_false(FloatType(32) != "f32")
  expect_false("f32" != FloatType(32))

  expect_false(FloatType(32) == "f64")
  expect_false("f64" == FloatType(32))
  expect_true(FloatType(32) != "f64")
  expect_true("f64" != FloatType(32))

  expect_true(IntegerType(32) == "i32")
  expect_true("i32" == IntegerType(32))
  expect_false(IntegerType(32) == "i64")

  expect_true(UIntegerType(16) == "ui16")
  expect_true("ui16" == UIntegerType(16))
  expect_false(UIntegerType(16) == "ui32")

  expect_true(BooleanType() == "i1")
  expect_true("i1" == BooleanType())
  expect_false(BooleanType() == "f32")

  expect_false(FloatType(32) == "i32")
  expect_false("i32" == FloatType(32))
})
