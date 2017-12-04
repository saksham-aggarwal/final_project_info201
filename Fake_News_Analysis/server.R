library(shiny)
library(dplyr)
library(stringr)
library(data.table)
library(ggplot2)

# Data Frame for Fake News
fakeNewsDataFrame <- fread("./fake.csv")

shinyServer(function(input, output) {
  # Insert server functions here
  searchCount <- reactive({
    # Organizes the data
    searchNewsCount <- dplyr::filter(fakeNewsDataFrame, 
                                     str_detect(str_to_lower(paste(fakeNewsDataFrame$text)), str_to_lower(input$search)))
    countComparison <- data.frame(titles = c(paste("News containing", input$search), 
                                             paste("News Not Containing", input$search)))
    countComparison$amounts <- c(nrow(fakeNewsDataFrame) - nrow(searchNewsCount), nrow(searchNewsCount))
    
    # Calculates percentages
    percentFound <- (100 * round((countComparison$amounts[2] / countComparison$amounts[1]), digits = 4))
    percentNotFound <- 100 - percentFound
    countComparison$percents <- c(percentFound, percentNotFound)

    # Creates pie chart
    pieChart <- ggplot(countComparison, aes(x = "", y = countComparison$percents, fill = titles)) +
      geom_bar(width = 1, stat = "identity") +
      coord_polar("y", start = 0) +
      labs(x = "", y = paste(percentFound, "% of articles contain ", input$search, sep = ""))
    pieChart
  })
  
  # Outputs the pie chart
  output$countFound <- renderPlot({
    print(searchCount())
  })
})