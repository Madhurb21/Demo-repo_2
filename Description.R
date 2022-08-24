library(rvest)
library(tidyverse)

html <- read_html("https://www.imdb.com/chart/top/")

names <- html %>% html_elements(".titleColumn a") %>% html_text()

##########################################################################

year_text <- html %>% html_elements(".titleColumn span") %>% html_text()
year <- as.numeric(substr(year_text, start = 2, stop = 5))

##########################################################################

ratings_text <- html %>% html_elements(".ratingColumn.imdbRating strong") %>% html_text()
ratings <- as.numeric(ratings_text)

##########################################################################

voters_text <- html %>% html_elements(".ratingColumn.imdbRating strong") %>% html_attrs()
voters_text_refined <- gsub(",", "", voters_text)
voters <- as.numeric(substr(gsub(" user ratings", "", voters_text_refined), start = 14, stop = 100))

##########################################################################

tags_text <- html %>% html_elements(".titleColumn a") %>% html_attrs()
tags <- substr(tags_text, start = 19, stop = 26)

##########################################################################

votes_table <- list()

for(i in 1:length(names))
{
  html <- read_html(paste("https://www.imdb.com/title/", tags[i], "/ratings/", sep = ""))
  
  all_ratings <- html %>% html_table()
  
  avg_men_votes <- as.numeric(substr(all_ratings[[2]]$`All Ages`[2], start = 1, stop = 3))
  avg_women_votes <- as.numeric(substr(all_ratings[[2]]$`All Ages`[3], start = 1, stop = 3))
  num_men_votes <- as.numeric(substr(gsub(",", "",gsub(" ", "", all_ratings[[2]]$`All Ages`[2])), start = 6, stop = 100))
  num_women_votes <- as.numeric(substr(gsub(",", "",gsub(" ", "", all_ratings[[2]]$`All Ages`[3])), start = 6, stop = 100))
  
  votes_seq <- as.numeric(gsub(",","", all_ratings[[1]]$Votes))
}