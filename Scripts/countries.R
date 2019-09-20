library(tidyverse)
gapminder <- read_csv("data/gapminder.csv")
colnames(gapminder)
nrow(gapminder)
dim(gapminder)
country <- gapminder$country
continent <- gapminder$continent
year <- gapminder$year
lifeExp <- gapminder$lifeExp
pop <- gapminder$pop
gdpPercap <- gapminder$gdpPercap
glimpse(gapminder)
colnames(storms)
tail(storms, 20)
summary(gapminder)
gapminder_factor <- read_csv("data/gapminder.csv", col_types = cols(continent = col_factor()))
summary(gapminder_factor)
rm(gapminder_factor_country)
NewSelection <- select(gapminder, country, year, pop)
NewSelection <- filter(select(gapminder, country, year, pop), country == "Australia")
NewSelection

select(gapminder, 3, 1, 5)
select(gapminder, 3:5)
select(gapminder, -lifeExp)
select(gapminder, -year)
select(gapminder, -(3:5))
just_population <- select(gapminder, pop)
just_population2 <- select(gapminder, 5)
select(gapminder, starts_with("co"))
select(gapminder, ends_with("p"))
rename(gapminder, population = pop)
gapminder <- rename(gapminder, lifeExp = lifeExp, gdpPercap = gdpPercap)
filter(gapminder, country == "Australia")
filter(gapminder, year >= 2007)
highLifeExp <- filter(gapminder, life_Exp >= 80)
filter(gapminder, continent == "Europe", life_Exp >= 80)
filter(gapminder, life_Exp >= 80, gdpPercap >= 30000)

#piping
ANZAC <- filter(gapminder, country %in% c("Australia", "New Zealand"))
ANZAC

Australia <- filter(select(gapminder, country, year, pop), country == "Australia")
Australia <- select(filter(gapminder, country == "Australia"), country, year, pop)

gapminder %>% select (year,pop)
filter(gapminder, country == "Australia", year>= 1997)

Australia1997 <- gapminder %>% 
  filter (country == "Australia") %>% 
  filter (year >= 1997)



