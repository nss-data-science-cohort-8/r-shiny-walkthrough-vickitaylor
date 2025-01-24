

library(shiny)
library(tidyverse)
library(glue) 
library(DT) 

penguins <- read_csv('./data/penguins.csv')


numeric_variables <- penguins |> 
  select(where(is.numeric), -year) |> 
  colnames() |> 
  sort()


varname = 'bill_depth_mm'

prepare_title <- function(varname){
  str_split(varname, '_')[[1]][1:2] |> 
    paste(collapse = ' ') |> 
    str_to_title()
  
}

prepare_title(varname)


prepare_x_label <- function(varname){
  str_split(varname, '_')[[1]][1:2] |> 
    paste(collapse = ' ') |>
    paste0(" (", str_split(varname, '_')[[1]][3], ")") 
}

prepare_x_label(varname)