num_1 <- numeric(length = 1e3) # Guess -> 8 kB
num_2 <- numeric(length = 1e6) # Guess -> 8 MB

size_1 <- object.size(num_1)
size_2 <- object.size(num_2)

mat_1 <- matrix(runif(100*1000), nrow = 100, ncol = 1000) # Guess -> 800 kB
mat_2 <- matrix(0, nrow = 100, ncol = 1000) # Guess -> 800 kB

size_mat_1 <- object.size(mat_1)
size_mat_2 <- object.size(mat_2)

#################################################

library(rbenchmark)

vec <- numeric(length = 1e4)

# for vs rnorm(n = 1e4) - for loop is slower
result_1 <- benchmark(
  {
    for(i in 1:1e4)
    {
      vec[i] <- rnorm(n = 1, mean = 0, sd = 1)
    }
  },
  {
    vec <- rnorm(n = 1e4, mean = 0, sd = 1)
  },
  replications = 100
)

# rnorm vs runif - rnorm is slower
result_2 <- benchmark(
  {
    vec <- rnorm(n = 1e4)
  },
  {
    vec <- runif(n = 1e4)
  },
  replications = 100
)

#################################################

with_loop <- function(n, rho)
{
  mat <- matrix(0, nrow = n, ncol = n)
  for(i in 1:n)
  {
    for(j in 1:n)
    {
      mat[i, j] = rho^(abs(i - j))
    }
  }
  return (mat)
}

without_loop <- function(n, rho)
{
  mat <- matrix(rho, nrow = n, ncol = n)
  mat <- mat^(abs(col(mat) - row(mat)))
  return (mat)
}

n = 10
mat_rho <- matrix(0, nrow = n, ncol = n)
result_3_10 <- benchmark(
  {
    mat_rho <- with_loop(n, 3)
  },
  {
    mat_rho <- without_loop(n, 3)
  },
  replications = 100
)
# for loop is faster

n = 100
mat_rho <- matrix(0, nrow = n, ncol = n)
result_3_100 <- benchmark(
  {
    mat_rho <- with_loop(n, 3)
  },
  {
    mat_rho <- without_loop(n, 3)
  },
  replications = 50
)
# without loop is slower

n = 1000
mat_rho <- matrix(0, nrow = n, ncol = n)
result_3_1000 <- benchmark(
  {
    mat_rho <- with_loop(n, 3)
  },
  {
    mat_rho <- without_loop(n, 3)
  },
  replications = 20
)
# without loop is faster

#################################################

n <- c(1e1, 1e2, 1e3, 1e4, 1e5, 1e6)

frac <- factorial(n)/(((n/exp(1))^n) * sqrt(2 * pi * n))

plot(n, frac)

#################################################

k = 5
x <- numeric(length = k)
x <- runif(k)

result_4 <- benchmark(
  {
    norm(x, "2")
  },
  {
    sqrt(sum(x^2))
  },
  replications = 100
)

#################################################

result_5 <- benchmark(
  {
    n = 1e3
    nums <- 1:(n^2)
    mat <- matrix(nums, nrow = n, ncol = 2)
    means <- apply(mat, MARGIN = 2, FUN = mean)
    norm.means <- sqrt(sum(means^2))
  },
  {
    n = 1e3
    nums <- 1:(n^2)
    mat <- matrix(nums, nrow = n, ncol = 2)
    means <- colMeans(mat)
    norm.means <- sqrt(sum(means^2))
  },
  replications = 100
)
