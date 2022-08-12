#factorial function

fac = function(num)
{
  ans <- 1
  for(i in 1:num)
  {
    ans = ans*i
  }
  return(ans)
}
fac(5)
fac(6)
