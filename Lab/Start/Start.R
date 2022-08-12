# Addition
1 + 2
3 + 5 - 2

# Assigning value
a <- 4
b <- 5
a <- 8

my.number <- 8
my.vector <- 5:10

# Functions
length(my.vector)
sum(my.vector)
prod(my.vector)
max(my.vector)
diff(my.vector)
mean(my.vector)
median(my.vector)

# using operators
a + b
my.number %% 5
my.vector %% 5
b/a + sqrt(my.number) - sin(b) + log(a)
b/a + sqrt(my.vector) - sin(b) + log(a)

# logical operators
my.vector == my.number
my.number == a

# vectors
index <- which(my.vector == my.number)
my.vector[index]
my.vector[3]
my.vector[3] <- 15
my.vector[c(1, 3)]
my.vector[c(3, 2, 4)]

# functions
greeting <- function(name)
{
  text <- paste("Hello", name)
  return(text)
}
greeting(Dootika)
greeting("Dootika")
greeting("Madhur")

add <- function(x)
{
  y <- x + 5
  return(y)
}
add(6)

add <- function(num1, num2 = 5)
{
  y <- num1 + num2
  return (y)
}
add(6)
add(num1 = 6, num2 = 10)