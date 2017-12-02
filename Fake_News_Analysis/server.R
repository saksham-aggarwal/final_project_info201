library(shiny)
library(dplyr)
library(stringr)
library(data.table)
library(ggplot2)

# Data Frame for Fake News
fakeNewsDataFrame <- fread("../data/fake.csv")

shinyServer(function(input, output) {
  # Insert server functions here
  searchCount <- reactive({
    # TODO: Make this output a ggplot pie chart of found articles with search query compared to number of all articles 
    searchNewsCount <- nrow(dplyr::filter(fakeNewsDataFrame, str_detect(fakeNewsDataFrame$text, input$search)))
  })
  
  
  output$countFound <- renderText(searchCount())
  
})