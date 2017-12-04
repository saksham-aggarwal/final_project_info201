library(shiny)
library(data.table)

fakeNewsData <- fread("../data/fake.csv") %>% 
  select(-uuid, -ord_in_thread, -crawled, -domain_rank, -spam_score, -main_img_url,
         -replies_count, -participants_count, -likes, -comments, -shares, -thread_title, -published)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$table <- renderDataTable(fakeNewsData)
})
  
