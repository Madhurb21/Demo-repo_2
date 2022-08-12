snowy = function(image)
{
  image_mat <- as.array(image)
  dim_img <- dim(image_mat)
  
  dist = matrix(0, nrow = dim_img[1], ncol = dim_img[2])
  
  for(i in 1:dim_img[1])
  {
    for(j in 1:dim_img[2])
    {
      dist[i, j] = norm(image_mat[i, j, 1, ] - c(1, 1, 1), "2")
    }
  }
  
  avg_white <- mean(dist)
  
  if(avg_white < 0.8)
  {
    print("Snowy")
  }else
  {
    print("No Snow")
  }
}

snowy(load.image("land1.jpeg"))
snowy(load.image("land2.jpeg"))

