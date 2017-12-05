library(shiny)
library(stringr)
library(data.table)

# source("global.R", local = TRUE)
# Fake news data frame to be shared between server.R and ui.R
fakeNewsDataFrame <- fread("../data/fake.csv") %>% 
  select(-uuid, -ord_in_thread, -crawled, -domain_rank, -spam_score, -main_img_url,
         -replies_count, -participants_count, -likes, -comments, -shares, -thread_title, -published)

# Storing the current state of the data frame
currentFakeNewsData <- fakeNewsDataFrame

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