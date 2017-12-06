library(shiny)
library(data.table)
library(dplyr)
library(stringr)
library(ggplot2)

# Fake news data frame to be shared between server.R and ui.R
fakeNewsDataFrame <- fread("fake.csv") %>% 
  select(-uuid, -ord_in_thread, -crawled, -domain_rank, -spam_score, -main_img_url,
         -replies_count, -participants_count, -likes, -comments, -shares, -thread_title, -published)

# Storing the current state of the data frame
currentFakeNewsData <- fakeNewsDataFrame