# a)

# n = num of coin tosses
# size = 
# prob = probabiltiy of success
# heads = num of heads

n <- 1000
size <- 1
phead <- 0.5
heads <- 0
proportion <- 0

experiment <- rbinom(n ,size, phead)

for(i in 1:length(experiment))
{
  if(experiment[i] == 1)
  {
    
    heads = heads + 1
  }
}

proportion = heads / 1000
  

