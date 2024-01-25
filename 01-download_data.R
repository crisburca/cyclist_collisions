### Preamble ###
# Author: Crisitna Burca
# Email: cristina.burca@mail.utoronto.ca
# Date: 23 January 2024

library(opendatatoronto)

resources <- list_package_resources("https://open.toronto.ca/dataset/motor-vehicle-collisions-involving-killed-or-seriously-injured-persons/")

datastore_resources <- filter(resources, tolower(format) %in% c('csv'))

raw_data <- filter(datastore_resources, row_number()==1) %>% get_resource()

write_csv(
  x = raw_data,
  file = "inputs/unedited_data.csv"
)

