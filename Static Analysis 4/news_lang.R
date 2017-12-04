library(dplyr)
library(ggplot2)

data_set <- read.csv("data/fake.csv", stringsAsFactors = FALSE)

pie_Chart <- function(dataset) {
  
  # english <- nrow(filter(dataset, language == "english"))
  portuguese <- nrow(filter(dataset, language == "portuguese"))
  greek <- nrow(filter(dataset, language == "greek"))
  turkish <- nrow(filter(dataset, language == "turkish"))
  russian <- nrow(filter(dataset, language == "russian"))
  french <- nrow(filter(dataset, language == "french"))
  finnish <- nrow(filter(dataset, language == "finnish"))
  arabic <- nrow(filter(dataset, language == "arabic"))
  spanish <- nrow(filter(dataset, language == "spanish"))
  german <- nrow(filter(dataset, language == "german"))
  norwegian <- nrow(filter(dataset, language == "norwegian"))
  chinese <- nrow(filter(dataset, language == "chinese"))
  italian <- nrow(filter(dataset, language == "italian"))
  dutch <- nrow(filter(dataset, language == "dutch"))
  polish <- nrow(filter(dataset, language == "polish"))
  ignore <- nrow(filter(dataset, language == "ignore"))
  
  df <- data.frame( 
    languages <- c( "Portuguese", "Greek", "Turkish", "Russian", "French", "Finnish", "Arabic", "Spanish", "German",
                   "Norwegian", "Chinese", "Italian", "Dutch", "Polish", "Ignore"),
    categories <- c( portuguese, greek, turkish, russian, french, finnish, arabic, spanish, german, norwegian, 
                    chinese, italian, dutch, polish, ignore)
  )
  
  pie_chart <- ggplot(df, aes( x = " ", y = categories, fill = languages)) + 
    geom_bar(width = 1, stat="identity") + coord_polar("y", start = 0) + ylab("News language")
  
  return(pie_chart)
}

graph <- pie_Chart(data_set)
ggsave(filename = "Static Analysis 4/news_lang.jpg", plot = graph)