### Preamble ###
# Author: Crisitna Burca
# Email: cristina.burca@mail.utoronto.ca
# Date: 23 January 2024
  

library(dplyr)
library(tidyverse)

set.seed(302)

num_records <- 1000
years <- 2006:2022
months <- 1:12
days <- 1:30
collisions <- c('Pedestrian', 'Cyclist')
injury <- c('None','Minimal', 'Minor', 'Major', 'Fatal')
collision_types <- sample(collisions, num_records, replace = TRUE, prob = c(0.3, 0.7))

count <- integer(num_records)

for (i in 1:num_records) {
  count[i] <- sum(collision_types[1:i] == collision_types[i])
}
simulated_data <- data.frame(
  year = sample(years, num_records, replace = TRUE),
  month = sample(months, num_records, replace = TRUE),
  day = sample(days, num_records, replace = TRUE),
  type_of_collision = sample(collisions, num_records, replace = TRUE, prob = c(0.3, 0.7)),
  severity = sample(injury, num_records, replace = TRUE, prob = c(0.3, 0.05, 0.1, 0.3, 0.15)),
  ccount = rep(1, num_records) 
  )
head(simulated_data)

