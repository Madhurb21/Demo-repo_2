library(rvest)
library(tidyverse)

html <- read_html("https://www.iitk.ac.in/math/faculty")

name <- html_elements(html, ".head3")
name <- html_elements(name, "a")
name <- html_text(name)

name_alt <- html_elements(html, ".head3 a")
name_alt <- html_text(name_alt)

name_alt_alt <- html %>% html_elements(".head3 a") %>% html_text()

