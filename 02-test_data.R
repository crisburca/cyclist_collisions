### Preamble ###
# Author: Crisitna Burca
# Email: cristina.burca@mail.utoronto.ca
# Date: 23 January 2024
  
library(tidyverse)
library(lubridate)
library(dplyr)

data <- read_csv("Motor Vehicle Collisions with KSI Data - 4326.csv", show_col_types = FALSE)

# filtering data
years <- data %>% 
  filter(IMPACTYPE == 'Cyclist Collisions' | IMPACTYPE == 'Pedestrian Collisions') %>% 
  select(DATE, IMPACTYPE, INVTYPE, INJURY, DRIVACT, PEDACT, CYCACT)

# sorting by date
years$DATE <- as.Date(years$DATE)
years <- years %>% arrange(DATE)

# created 'month' and 'year' columns to help with data analyzing
years <- years %>%
  mutate(YEAR = format(DATE, "%Y"), 
         MONTH = format(DATE, "%m")) %>%
  group_by(YEAR, MONTH)






