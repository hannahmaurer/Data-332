library(readxl)
library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)
library(lubridate)

setwd('C:/Users/hanna/Documents/DATA 332/StudentData')
df_student <- read_excel('Student.xlsx', .name_repair = 'universal')
df_course <- read_excel('Course.xlsx', .name_repair = 'universal')
df_registration <- read_excel('Registration.xlsx', .name_repair = 'universal')

df <- left_join(df_student, df_registration, by = c('Student.ID'))
df <- left_join(df, df_course, by = c('Instance.ID'))

df_majors_chart <- df %>%
  group_by(Title) %>%
  summarize(count = n())
  
ggplot(df_majors_chart, aes(x = Title, y = count)) +
  geom_col() +
  theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1))

df$Birth.Date <- as.Date(df$Birth.Date)
df$Birth.Year <- year(df$Birth.Date)

df_birth_year_chart <- df %>%
  group_by(Birth.Year) %>%
  summarize(count = n())
  
ggplot(df_birth_year_chart, aes(x = Birth.Year, y = count)) +
  geom_col() +
  theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1))

df_total_cost_per_major <- df %>%
  group_by(Cost, Payment.Plan) %>%
  summarize(Total.Cost = sum(Total.Cost))
print(df_total_cost_per_major)

df_total_balance_due_per_major <- df %>%
  group_by(Title, Payment.Plan) %>%
  summarize(Total_Balance_Due = sum(Balance.Due))
print(df_total_balance_due_per_major)