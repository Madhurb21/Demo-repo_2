rotate_180 <- function(image)
{
  image_mat <- as.array(image)
  dim_image <- dim(image_mat)
  
  image_rotated_mat <- array(0, dim = dim_image)
  
  for(i in 1:dim_image[1])
  {
    for(j in 1:dim_image[2])
    {
      image_rotated_mat[(dim_image[1] + 1) - i, (dim_image[2] + 1) - j, 1, ] = image_mat[i, j, 1, ]
    }
  }
  
  image_rotated <- as.cimg(image_rotated_mat)
  
  plot(image_rotated)
  
}

rotate_180(load.image("dog.jpeg"))
