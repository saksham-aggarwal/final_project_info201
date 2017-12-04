library(shiny)

source("global.R", local = TRUE)

shinyUI(fluidPage(

  # Application title
  titlePanel("Article Finder"),
  
  fluidRow(
    # Insert selectInput menus
    column(3,
           selectInput("language",
                       "Language",
                       c("All",
                         sort(unique(str_to_title(as.character(currentFakeNewsData$language))))))
    ),
    column(3,
           selectInput("author",
                       "Author",
                       c("All",
                         sort(unique(as.character(currentFakeNewsData$author)))))
    ),
    column(3,
           selectInput("country",
                       "Country",
                       c("All",
                         sort(unique( as.character(currentFakeNewsData$country)))))
    )
  ),
    
    fluidRow(
      dataTableOutput("table")
    )
  )
)