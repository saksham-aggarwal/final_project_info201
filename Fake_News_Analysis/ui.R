library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    
  # Application title
    titlePanel("Getting Real About Fake News"),

    # Sidebar for user input
    sidebarLayout(
      sidebarPanel(
        
        textInput("search", "Search", placeholder = "Search here", value = "Trump")
      ),
      
      mainPanel(
        # Insert plots and data here
        
        # Pie chart 
        plotOutput("countFound")
      )
    )
  )
)