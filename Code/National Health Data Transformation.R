library(tidyverse)
library(haven)

survey_data <- read_dta(
  "/Users/michaelharper/OMSBA 5112 R Files/week_1/Raw Data/IAHR52FL.dta")
View(survey_data)
survey_subset <- select(survey_data, hhid:shstruc)
