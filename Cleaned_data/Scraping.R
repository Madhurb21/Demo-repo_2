library(rvest) 

html <- read_html("https://en.wikipedia.org/wiki/List_of_deadliest_aircraft_accidents_and_incidents") 

tab <- html_table(html)

aircraft_data <- tab[[4]]
dims <- dim(aircraft_data)

temp_data <- aircraft_data[c(2:dims[1]), ]

deaths_total <- temp_data[ , 1]
deaths_crew <- temp_data[ , 2]
deaths_passengers <- temp_data[ , 3]
deaths_ground <- temp_data[ , 4]

survivors <- temp_data[ , 5]
for(i in 1:dim(survivors)[1])
{
  if(survivors[i, 1] == '†')
  {
    survivors[i, 1] = '0'
  }
}

type <- temp_data[ , 6]

aircraft <- temp_data[ , 8]

phase <- data.frame(Phase = substr(temp_data$Phase, 1, 3))

date <- temp_data[ , 13]
date_num <- numeric(length = dim(date)[1])
for(i in 1:dim(date)[1])
{
  date_num[i] <- as.numeric(substr(date[i, 1], 1, 4))
}

######################################################################
dat <- data.frame(deaths_total, deaths_crew, deaths_passengers, type, phase, date_num)
dim(dat)
#cleaning of total deaths columns
dat[1,1]<-"1700"
dat[2,1]<-"1000"
#################################
dat[65,3]<-"151"
dat[94,3]<-"136"
dat[98,3]<-"110"
dat<-dat[-205,]
dat<-dat[-288,]
dat<-dat[-333,]
dat<-dat[-337,]
dat<-dat[-423,]
dat<-dat[-477,]
dat<-dat[-485,]
dat<-dat[-496,]
dat<-dat[-525,]

dat[1] <- sapply(dat[1], as.numeric)
dat[2] <- sapply(dat[2], as.numeric)
dat[3] <- sapply(dat[3], as.numeric)

save(dat, file = "Cleaned_data_2.Rdata")




