library(ggplot2)

data <- load("Cleaned_data_2.Rdata")

phase_death <- ggplot(dat, aes(x = Phase, y = Deaths))
phase_death + geom_bar(stat = "identity", width = 0.5)
