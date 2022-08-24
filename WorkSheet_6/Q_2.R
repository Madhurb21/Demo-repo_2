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
temp_votes_without_comma <- matrix(0 ,nrow = 250, ncol = 1)

for(i in 1:250)
{
  temp_votes_without_comma[i] <- gsub(",","", temp_votes[i])
  temp_votes_without_comma[i] <- gsub(" user ratings","", temp_votes_without_comma[i])
}

temp_votes_num <- numeric(length = 250)
temp_votes_num <- as.numeric(substr(temp_votes_without_comma, start = 14, stop = 10000))

list <- matrix(0, nrow = length(names), ncol = 4)

list[ ,1] = names
list[ ,2] = rating
list[ ,3] = dates
list[ ,4] = temp_votes_num

