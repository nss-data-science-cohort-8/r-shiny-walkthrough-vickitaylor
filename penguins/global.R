

library(shiny)
library(tidyverse)
# had to import glue to get the title to work...
library(glue) 

penguins <- read_csv('./data/penguins.csv')
