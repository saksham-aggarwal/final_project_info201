library(shiny)
library(dplyr)
library(data.table)


shinyUI(fluidPage(
  
  titlePanel("How Fake is Fake News"),
  
  sidebarLayout(
    sidebarPanel(
        textInput("search", "Search", placeholder = "Search here", value = "Trump")
    ),
    
    mainPanel(
      textOutput("prompt"),
      textOutput("text")
    )
  )
  
  )
)