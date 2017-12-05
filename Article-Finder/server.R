library(shiny)
library(data.table)
library(dplyr)

# Fake news data frame to be shared between server.R and ui.R
fakeNewsDataFrame <- fread("../data/fake.csv") %>% 
  select(-uuid, -ord_in_thread, -crawled, -domain_rank, -spam_score, -main_img_url,
         -replies_count, -participants_count, -likes, -comments, -shares, -thread_title, -published)

# Storing the current state of the data frame
currentFakeNewsData <- fakeNewsDataFrame

shinyServer(function(input, output) {
  # source("global.R", local = TRUE)
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
  
