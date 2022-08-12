library(imager)

dog <- load.image("dog.jpeg")
col.mat <- as.array(dog[, , 1, ])
dims <- dim(col.mat)

plot(dog)

dist <- matrix(0, nrow = dims[1], ncol = dims[2])

for(i in 1:nrow(dist))
{
  for(j in 1:ncol(dist))
  {
    dist[i, j] = norm(col.mat[i, j, ] - c(0, 1, 0), "2")
  }
}

points(which(dist == min(dist), arr.ind = TRUE), col = "red")

###############################################################

dist_red <- matrix(0, nrow = dims[1], ncol = dims[2])

for(i in 1:nrow(dist_red))
{
  for(j in 1:ncol(dist_red))
  {
    dist_red[i, j] = norm(col.mat[i, j, ] - c(1, 0, 0), "2")
  }
}

points(which(dist_red == min(dist_red), arr.ind = TRUE), col = "red")

###############################################################

dist_blue <- matrix(0, nrow = dims[1], ncol = dims[2])

for(i in 1:nrow(dist_blue))
{
  for(j in 1:ncol(dist_blue))
  {
    dist_blue[i, j] = norm(col.mat[i, j, ] - c(0, 0, 1), "2")
  }
}

points(which(dist_blue == min(dist_blue), arr.ind = TRUE), col = "red")

