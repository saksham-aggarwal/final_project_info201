library(shiny)

fakeNewsData <- fread("../data/fake.csv")

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Article Finder"),
  
  fluidRow(
    # Insert selectInput menus
    column(3,
           selectInput("language",
                       "Language",
                       c("All",
                         unique(as.character(fakeNewsData$language))))
    ),
    column(3,
           selectInput("author",
                       "Author",
                       c("All",
                         unique(as.character(fakeNewsData$author))))
    ),
    column(3,
           selectInput("country",
                       "Country",
                       c("All",
                         unique(as.character(fakeNewsData$country))))
    )
  ),
    
    fluidRow(
      dataTableOutput("table")
    )
  )
)