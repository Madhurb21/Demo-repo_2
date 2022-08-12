col1 <- load.image("col1.png")
col2 <- load.image("col2.png")
col3 <- load.image("col3.png")

col1_mat <- as.array(col1)
col2_mat <- as.array(col2)
col3_mat <- as.array(col3)

if(col1_mat[1, 1, 1, 1])
{
  col1_col <- "red"
}else if(col1_mat[1, 1, 1, 2])
{
  col1_col <- "green"
}else
{
  col1_col <- "blue"
}

################################################

if(col2_mat[1, 1, 1, 1])
{
  col2_col <- "red"
}else if(col2_mat[1, 1, 1, 2])
{
  col2_col <- "green"
}else
{
  col2_col <- "blue"
}

###############################################

if(col3_mat[1, 1, 1, 1])
{
  col3_col <- "red"
}else if(col3_mat[1, 1, 1, 2])
{
  col3_col <- "green"
}else
{
  col3_col <- "blue"
}

