library(shiny)
library(data.table)


shinyServer(function(input, output) {
  source("global.R", local = TRUE)
  reactiveFakeNewsData <- reactive({
    # Resets fake news data frame
    currentFakeNewsData <- fakeNewsDataFrame
    
    # Filters by language 
    if (input$language != "All") {
      currentFakeNewsData <- filter(currentFakeNewsData, language == str_to_lower(input$language))
    }
    
    # Filters by author 
    if (input$author != "All") {
      currentFakeNewsData <- filter(currentFakeNewsData, author == input$author)
    }
    
    # Filters by country
    if (input$country != "All") {
      currentFakeNewsData <- filter(currentFakeNewsData, country == input$country)
    }
    
    currentFakeNewsData
  })
  
  output$table <- renderDataTable(reactiveFakeNewsData())
})
  
