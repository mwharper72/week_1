library(tidyverse)
library(dplyr)
library(haven)

## Load raw data ##
survey_data <- read_dta(
  "/Users/michaelharper/OMSBA 5112 R Files/week_1/Raw Data/IAHR52FL.dta")
View(survey_data)
survey_subset <- select(survey_data, hhid:shstruc)

## Create histogram of subset data ##
survey_subset <- rename(survey_subset, household_size = hv009)
ggplot(data = survey_subset) +
  geom_histogram(mapping = aes(x = household_size), binwidth = 1)

## Create bar graph of subset data ##
ggplot(data = survey_subset) +
  geom_bar(aes(x = household_size), fill = 'blue') 

## Create a subset of urban households as "TRUE" ##
residence_type <- mutate(survey_subset, urban = hv025 == 1)
residence_type
residence_type$urban <- as.factor(residence_type$urban) #convert urban col to factor
class(residence_type$urban)

##### <-- Need to classify by **Type of Urban Area** #####  use hv026
### Place of residence
# 0  Capital, large city
# 1  Small city
# 2  Town
# 3  Countryside
# (m) 9  Missing

## Create data frame by urban city size ##
residence_type <- rename(residence_type, city_size = hv026)
urban_city_size <- filter(residence_type, city_size %in% c(0, 1, 2))
urban_city_size$city_size <- as.factor(urban_city_size$city_size)

## Boxplot of only urban residences by city size ##
urban_plot <- ggplot(data = urban_city_size, mapping = aes(x = city_size,
                                             y = household_size,
                                             fill = city_size)) + 
  geom_boxplot() +
  coord_flip() +
  scale_fill_discrete(name = "City Size", labels = c("Large/Capital", "Small City", "Town"))
urban_plot






