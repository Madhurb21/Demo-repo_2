library(rvest)
library(tidyverse)

html <- read_html("https://www.iitk.ac.in/math/faculty")

name <- html_elements(html, ".head3 a")
name <- html_text(name)

degree <- html_elements(html, ".head3")
degree <- html_text(degree)

name_with_PhD <- matrix(nrow = length(name), ncol = 2)

for(i in 1:length(name))
{
  name_with_PhD[i,1] = name[i]
  name_with_PhD[i,2] = degree[i]
  if(name_with_PhD[i, 2])
}


