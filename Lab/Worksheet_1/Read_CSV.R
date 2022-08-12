seat <- read.csv("https://dvats.github.io/assets/course/mth208/seating.csv")

my.roll = 210572

my.seat <- which(seat[ ,1] == my.roll)

print(seat[my.seat, ])
