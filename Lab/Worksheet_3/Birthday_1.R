age <- 25

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

nturn <- num_of_turn(age)

