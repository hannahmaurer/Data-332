library(tidyverse)
library(readxl)
library(here)
library(skimr) 
library(kableExtra)
library(dplyr)

setwd('C:/Users/hanna/Documents/DATA 332')
lobsters <- read.csv('LOBSTER/LOB1.csv')

skimr::skim(lobsters)

lobsters %>%
  group_by(YEAR) %>%
  summarize(count_by_year = n())

lobsters %>%
  summarize(count =  n())

lobsters %>%
  group_by(YEAR)

lobsters %>%
  group_by(SITE, YEAR) %>%
  summarize(count_by_siteyear =  n())

siteyear_summary <- lobsters %>%
  group_by(SITE, YEAR) %>%
  summarize(count_by_siteyear =  n(), 
            mean_size_mm = mean(SIZE_MM, na.rm = TRUE), 
            sd_size_mm = sd(SIZE_MM, na.rm = TRUE))

siteyear_summary %>%
  kable()

siteyear_summary <- lobsters %>%
  group_by(SITE, YEAR) %>%
  summarize(count_by_siteyear =  n(), 
            mean_size_mm = mean(SIZE_MM, na.rm = TRUE), 
            sd_size_mm = sd(SIZE_MM, na.rm = TRUE), 
            median_size_mm = median(SIZE_MM, na.rm = TRUE))

siteyear_summary <- lobsters %>%
  dplyr::filter(SIZE_MM > 0)

ggplot(data = siteyear_summary, aes(x = YEAR, y = SIZE_MM, color = SITE)) +
  geom_line() 
