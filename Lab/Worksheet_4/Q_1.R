dog <- load.image("dog.jpeg")
dog_dim <- dim(dog)
plot(dog)

graydog <- grayscale(dog)
gray_dog_dim <- dim(graydog)
plot(graydog)

gray_dog_mat <- as.matrix(graydog[, , 1, 1])
gray_dog_mat_dim <- dim(gray_dog_mat)

col_mat <- as.array(dog[, , 1, ])
col_mat_dim <- dim(col_mat)

cropped_mat <- col_mat[1:300, , ]
cropped_img <- as.cimg(cropped_mat)
plot(cropped_img)