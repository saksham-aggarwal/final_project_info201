library(shiny)
library(dplyr)
library(stringr)
library(data.table)

# Data Frame for Fake News
fakeNewsDataFrame <- fread("../data/fake.csv")

shinyServer(function(input, output) {
  # Insert server functions here
})