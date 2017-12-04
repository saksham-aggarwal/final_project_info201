library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Article Finder"),
  
  sidebarLayout(
    sidebarPanel(

    ),
    
    mainPanel(
      dataTableOutput("table")
    )
  )
))
