library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    
  # Application title
    titlePanel("Getting Real About Fake News"),

    #FIXME: put the textInput in the correct place
    textInput("search", "Search"),

    # Sidebar for user input
    sidebarLayout(
      sidebarPanel(
        
        
      ),
      
      mainPanel(
        # Insert plots and data here
        
        # TODO: Make this output ggplot, see server file for more details
        textOutput("countFound")
        
      )
    )
  )
)