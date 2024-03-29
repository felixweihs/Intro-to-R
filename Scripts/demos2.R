# Excel files
library(tidyverse)
gapminder_excel <- read_excel("data/gapminder.xlsx")
library(readxl)
read_excel("data/gapminder.xlsx", range = "A1:E4")
read_excel("data/gapminder.xlsx", sheet = 1, range = "A1:E4")

#Writing data out
write_csv(gapminder_excel, "results/gapminder_output.csv")

Australia <- gapminder_excel %>% 
  filter (country == "Australia") %>% 
  select (country, year, pop) %>% 
  write_csv("results/australia.csv")
