#1 SOME PLAYING AROUND WITH MATHEMATICAL FUNCTIONS, EQUALITY AND VARIABLES
x <- 1 + 100 / 5^4
y <- 1
x / y
if (x > y){
  print ("x is bigger than y")
} 
else {
  print("y is bigger than x")
  }

x <- NA
is.na(x)

#2 VECTORS
z <- 1:5
z + 5
z <- c(4,7,3,8,9234,3)

#3 VARIABLE NAMING SYSTEM and DELETING VARIABLES
2minheight <- 5
_age <- 5
.mass <- 5
ls(all.names = TRUE)
rm(min_height)
3^(10:50)
ls()
installed.packages()
installed.packages("tidyverse")

#4 Dataframes
read.csv("data/gapminder.csv")
library(tidyverse)
read_csv("data/gapminder.csv")
read.csv("data/gapminder.csv")
