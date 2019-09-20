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

Australia <- filter( select(gapminder, country, year, pop), country == "Australia")
Australia
Australia <- select(filter(gapminder, country == "Australia"), country, year, pop)

gapminder %>% select (year,pop)
filter(gapminder, country == "Australia", year>= 1997)

Australia1997 <- gapminder %>% 
  filter (country == "Australia") %>% 
  filter (year >= 1997)

Australia <- gapminder %>% 
  filter(country == "Australia") %>% 
  select(country, year, pop) %>% 
  rename(population = pop)
Australia

#Mutate and transmute
RichCountries <- mutate(gapminder, gdp = gdpPercap * pop) %>% 
  filter(gdp >= 1000000000000)
RichCountries

populationM <- mutate(gapminder, populationM = pop / 10^6)
populationM

populationM <- mutate(gapminder, log_of_pop = log(pop))
str_sub("A long bit of text", start = 1, end = 5)

populationM <- mutate(gapminder, country_abbr = str_sub(country, start = 1, end = 3))
populationM <- mutate(gapminder, country_n_length = str_length(country))

populationM <- mutate(
  gapminder, 
  lifeExp_days = lifeExp * 365, 
  gdp = gdpPercap * pop,
  gdp_m = gdp/ 10^9
  )

populationM <- transmute(
  gapminder, 
  country = str_sub(country, start = 1, end = 3),
  year = year,
  lifeExp = lifeExp * 365, 
    )
populationM <- filter(populationM, year == 2007)
  
#Summarising data
summarise(
  gapminder, 
  mean_pop_M = mean(pop)/10^6,
  median_pop_M = median(pop)/10^6,
  )

summarise_if(gapminder, is.numeric, mean)

#grouping
group_by_country <- group_by(gapminder, country)
group_by_country
summarise(group_by_country, mean_pop = mean(pop))
summarise(group_by_country, pop_1952 = min(pop)/10^6, pop_2007 = max(pop)/10^6)

group_by_continent <- gapminder %>% 
  group_by(continent) %>% 
  summarise(mean_pop = mean(pop), median_pop = median(pop))
group_by_continent

#arrange and group exercises
arrange(gapminder, gdpPercap)
arrange(gapminder, desc(gdpPercap))

group_by_country <- gapminder %>% 
  group_by(country) %>% 
  summarise(mean_lifeExp = mean(lifeExp)) %>% 
  arrange(desc(mean_lifeExp)) %>% 
  filter(mean_lifeExp == min(mean_lifeExp) + mean_lifeExp == max(mean_lifeExp))
group_by_country

summarise(gapminder, num_rows = n())
summarise(group_by_country, num_rows = n())

#group by countries
#filter or select by years 1987 and 2007
#arrange by life expectance descending
challenge_country <- gapminder %>% 
  group_by(country) %>% 
  filter(year == "2007" | year == "1987") %>% 
  arrange(desc(lifeExp))


challenge_country

