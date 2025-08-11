
test_that("shannon_entropy works correctly", {
  p <- c(0.2, 0.5, 0.3)
  expect_equal(round(shannon_entropy(p), 6), round(-sum(p * log(p)), 6))

  # Edge case: uniform distribution
  p_uniform <- rep(1/4, 4)
  expect_equal(shannon_entropy(p_uniform), log(4))

  # Invalid probability vector
  expect_error(shannon_entropy(c(0.2, 0.8, 0.1)))
  expect_error(shannon_entropy(c(-0.1, 0.5, 0.6)))
})

test_that("renyi_entropy works correctly", {
  p <- c(0.2, 0.5, 0.3)
  q <- 2
  expected <- (1 / (1 - q)) * log(sum(p^q))
  expect_equal(renyi_entropy(p, q), expected)

  # q -> 1 should match Shannon entropy
  expect_equal(renyi_entropy(p, 1), shannon_entropy(p), tolerance = 1e-8)

  expect_error(renyi_entropy(p, -1))
  expect_error(renyi_entropy(c(0.2, 0.2, 0.7), 2)) # invalid p
})

test_that("renyi_extropy works correctly", {
  p <- c(0.2, 0.5, 0.3)
  q <- 2
  n <- length(p)
  expected <- (-(n - 1) * log(n - 1) + (n - 1) * log(sum((1 - p)^q))) / (1 - q)
  expect_equal(renyi_extropy(p, q), expected)

  # q -> 1 should match extropy
  expect_equal(renyi_extropy(p, 1), extropy(p), tolerance = 1e-8)

  expect_error(renyi_extropy(p, NaN))
})

test_that("extropy works correctly", {
  p <- c(0.2, 0.5, 0.3)
  expected <- -sum((1 - p) * log(1 - p))
  expect_equal(extropy(p), expected)

  p_uniform <- rep(1/3, 3)
  expect_equal(extropy(p_uniform), -sum((1 - p_uniform) * log(1 - p_uniform)))
})

test_that("tsallis_entropy works correctly", {
  p <- c(0.2, 0.5, 0.3)
  q <- 2
  expected <- (1 - sum(p^q)) / (q - 1)
  expect_equal(tsallis_entropy(p, q), expected)

  # q -> 1 should match Shannon entropy
  expect_equal(tsallis_entropy(p, 1), shannon_entropy(p), tolerance = 1e-8)

  expect_error(tsallis_entropy(p, -2))
  expect_error(tsallis_entropy(c(0.2, 0.8, 0.1), 2))
})
