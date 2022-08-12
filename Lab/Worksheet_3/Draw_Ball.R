red <- 1
green <- 2
blue <- 3

bag <- c(red, red, red, green, green, blue, blue)

drawn <- sample(bag, size = 1)

if(drawn == 1)
{
  print("Blue")
}else if(drawn == 2)
{
  print("Green")
}else 
{
  print("Red")
}

