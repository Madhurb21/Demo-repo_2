sum <- 0
count <- 0

while(sum < 1)
{
  sum = sum + runif(1, min = 0, max = 1)
  count = count + 1
}
  
print(count)