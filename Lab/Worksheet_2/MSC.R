seat <- read.csv("https://dvats.github.io/assets/course/mth208/seating.csv")

msc <- 0

for(i in 1:nrow(seat))
{
  if((seat[i, 1] %/% 10000) == 22)
  {
    msc = msc + 1
  }
}

print(msc)
