library(dplyr)
library(data.table)
library(stringr)

fakeNews <- data.frame(fread("C:/Users/bower/Info201/final_project_info201/data/fake.csv"))

shinyServer(function(input, output) {
  
  avgSpam <- reactive ({
    selectedData <- fakeNews %>% 
      filter(str_detect(str_to_lower(paste(fakeNews$text)), str_to_lower(input$search))) %>%
      filter(spam_score != 0)
    
    sumSpam <- sum(selectedData$spam_score)
    returnValue <- 1.0 * sumSpam / nrow(selectedData)
    returnValue <- paste0(returnValue, "")
    return(returnValue)
  })
  
  output$text <- renderText({print(avgSpam())})
})