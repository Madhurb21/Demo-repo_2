num = 1000

vec <- numeric(length = num)

for(i in 1:num)
{
  sum <- 0
  count <- 0
  
  while(sum < 1)
  {
    sum = sum + runif(1, min = 0, max = 1)
    count = count + 1
  }
  
  vec[i] = count
}