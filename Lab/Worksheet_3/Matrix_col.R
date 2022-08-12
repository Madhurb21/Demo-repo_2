norm_vec <- c(0, 0, 0)
p_vec <- c(0, 0, 0)
sum <- 0

row <- 3
col <- 3

A <- matrix(c(3, 1, -2, 4, 5, 3, -1, 2, 2), nrow = 3, ncol = 3)

for(i in 1:col)
{
  norm_vec[i] <- norm(A[ ,i], type = "2")
}

sum <- sum(norm_vec)

for(i in 1:col)
{
  p_vec[i] <- norm_vec[i]/sum
}

column <- sample(1:col, size = 1, prob = p_vec)

print(column)

