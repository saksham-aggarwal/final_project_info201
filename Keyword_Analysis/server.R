library(shiny)
library(data.table)
library(dplyr)
library(stringr)
library(ggplot2)

fakeNews <- data.frame(fread("fake.csv"))

shinyServer(function(input, output) {
  
  avgSpam <- reactive ({
    selectedData <- fakeNews %>% 
      filter(str_detect(str_to_lower(paste(fakeNews$text)), str_to_lower(input$search))) %>%
      filter(type %in% input$types) %>%
      filter(spam_score != 0)
    
    sumSpam <- sum(selectedData$spam_score)
    returnValue <- round(1.0 * sumSpam / nrow(selectedData), digits = 4) * 100.0
    returnValue <- paste0(returnValue, "%")
    return(returnValue)
  })
  
  avgSpamPlot <- reactive ({
    selectedData <- fakeNews %>% 
      filter(str_detect(str_to_lower(paste(fakeNews$text)), str_to_lower(input$search))) %>%
      filter(type %in% input$types) %>%
      filter(spam_score != 0)
    
    typeData <- fakeNews %>%
      filter(type %in% input$types) %>%
      filter(spam_score != 0)
    
    valueComparison <- data.frame(c("Selected percentage", "Total Percentage"), titles = c("Selected percentage", "Total percentage"))
    selectedPercentage <- (100.0 * round((sum(selectedData$spam_score) / nrow(selectedData)), digits = 4))
    typePercentage <- (100.0 * round((sum(typeData$spam_score) / nrow(typeData)), digits = 4))
    valueComparison$percents <- c(selectedPercentage, typePercentage)
    
    returnPlot <- ggplot(data = valueComparison, aes(x=titles, y=percents)) + geom_bar(stat="identity")
    return(returnPlot)
})
  
  output$text <- renderText({print(avgSpam())})
  
  output$prompt <- renderText({
    print(paste0("Articles containing the keyword '", input$search, "' have a spam score of:"))
  })
  
  output$plot <- renderPlot({
    print(avgSpamPlot())
  })
})