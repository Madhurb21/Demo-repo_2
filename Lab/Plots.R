library(ggplot2)
library(dplyr)

load("IMDB_movies.Rdata")

hist(dat$rating, xlab = "Ratings", ylab = "Frequency", main = "Histogram of Ratings")
hist(dat$rating, xlab = "Ratings", ylab = "Frequency", main = "Histogram of Ratings", col = "white")

boxplot(dat$rating, ylab = "Freq", xlab = "Ratings", col = "pink")
boxplot(dat$men_rating, dat$women_rating, names = c("Men Rating", "Women Rating"), col = c("yellow", "light blue"))

hist(dat$men_rating, 
     col = adjustcolor("yellow", alpha.f = 0.5),
     xlab = "Rating",
     xlim = range(min(dat$men_rating, dat$women_rating), max(dat$men_rating, dat$women_rating)),
     main = "Histogram of Men and Women Ratings")
hist(dat$women_rating, col = adjustcolor("blue", alpha.f = 0.5), add = TRUE)
legend("topright", legend = c("Men", "Women"), fill = c("yellow", "light blue"))

plot(dat$over.votes, dat$rating,
     xlab = "Votes", ylab = "Ratings",
     main = "Ratings vs. Votes", xlim = range(0, 3500000))

moreThan <- filter(dat, dat$rating > 8.9)
text(moreThan$over.votes, moreThan$rating, labels = moreThan$name)


old <- filter(dat, dat$year < 1996)
points(old$over.votes, old$rating, col = "red")

legend("bottomright", legend = c("< 1996", ">= 1996"), fill = c("red", "black"))

plot(dat$over.votes[1], dat$rating[1],
     xlab = "Votes", ylab = "Ratings",
     main = "Ratings vs. Votes", 
     xlim = range(0, 3500000), ylim = range(8, 10))
for(i in 2:250)
{
  Sys.sleep(1)
  points(dat$over.votes[i], dat$rating[i], col = adjustcolor("red", red.f = i/250))
}
