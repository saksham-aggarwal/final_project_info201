library(shiny)
library(dplyr)
library(data.table)


shinyUI(fluidPage(
  
  titlePanel("Website Validity"),
  
  sidebarLayout(
    sidebarPanel(
        textInput("search", "Search", placeholder = "Search here", value = "Trump")
    ),
    
    mainPanel(
      textOutput("text")
    )
  )
  
  )
)