tennis <- function(p)
{
  games_played <- 0
  victory <- numeric(length = 5)
  
  for(i in 1:5)
  {
    if(sum(victory) >= 3)
    {
      break
    }
    else if((games_played == 3) & sum(victory) == 0)
    {
      break
    }
    else if((games_played == 4) & sum(victory) >= 0 & sum(victory) < 2 )
    {
      break
    }
    else if((games_played == 5) & sum(victory) <= 2 & sum(victory) >= 0)
    {
      break
    }
    victory[i] <- rbinom(n = 1, size = 1, prob = p)
    games_played = games_played + 1
  }
  return(games_played)
}

matches <- numeric(length = 1000)

for(i in 1:1000)
{
  matches[i] <- tennis(0.7)
}

ans <- mean(matches)

