age <- 30
num <- 1000

num_of_turn <- function(age)
{
  candles <- age
  nturn <- 0
  
  while(candles != 0)
  {
    nturn <- nturn + 1
    candles = candles - sample(1:candles, size = 1)
  }
  return(nturn)
}

vec <- numeric(length <- num)

for(i in 1:num)
{
  vec[i] = num_of_turn(age)
}

avg = mean(vec)
