library(shiny)
library(dplyr)
library(data.table)


shinyUI(fluidPage(
  
  titlePanel("How Fake is Fake News"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("search", "Search", placeholder = "Search here", value = "Trump"),
      
      checkboxGroupInput("types",
                         "Type of BS",
                         c("bs" = "bs", 
                           "conspiracy" = "conspiracy",
                           "fake" = "fake",
                           "satire" = "satire",
                           "hate" = "hate",
                           "junksci" = "junksci",
                           "state" = "state"),
                         selected = "bs")
    ),
    
    mainPanel(
      textOutput("prompt"),
      textOutput("text"),
      plotOutput("plot")
    )
  )
  
)
)