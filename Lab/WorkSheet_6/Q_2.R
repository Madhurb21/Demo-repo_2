library(rvest)
library(tidyverse)

html <- read_html("https://www.imdb.com/chart/top/")

#####################################################################################

names <- html %>% html_elements(".titleColumn a") %>% html_text()

#####################################################################################

dates_text <- html %>% html_elements(".titleColumn .secondaryInfo") %>% html_text()
dates <- numeric(length(dates_text))

for(i in 1:length(dates))
{
  dates_text[i] = substr(dates_text[i], start = 2, stop = 5)
  dates[i] = as.integer(dates_text[i])
}

#####################################################################################

temp <- html %>% html_elements(".ratingColumn strong") %>% html_text()
rating <- numeric(length(temp))

for(i in 1:length(temp))
{
  rating[i] = as.numeric(temp[i])
}

#####################################################################################

temp_votes <- html %>% html_elements(".ratingColumn strong") %>% html_attrs()
temp_votes_num <- matrix(0 ,nrow = 250, ncol = 1)

for(i in 1:250)
{
  temp_votes_num[i] <- gsub(temp_votes[i], ",","", temp_votes_num[i])
}

list <- matrix(0, nrow = length(names), ncol = 4)

