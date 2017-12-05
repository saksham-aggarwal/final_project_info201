library(dplyr)
library(ggplot2)

bar.Graph <- function(dataset) {
  
#bs <- nrow(filter(dataset, type == "bs"))
conspiracy <- nrow(filter(dataset, type == "conspiracy"))
fake <- nrow(filter(dataset, type == "fake"))
satire <- nrow(filter(dataset, type == "satire"))
hate <- nrow(filter(dataset, type == "hate"))
junksci <- nrow(filter(dataset, type == "junksci"))
state <- nrow(filter(dataset, type == "state"))

data <- data.frame( 
  Types <- c("Conspiracy", "Fake", "Satire", "Hate", "Junksci", "State"),
  Categories <- c(conspiracy, fake, satire, hate, junksci, state)
)

bar_graph <- ggplot(data, aes(x = Types , y = Categories, fill = Types)) +
  geom_bar(stat="identity")

  return(bar_graph)
}

#graph <- bar.Graph(data_set)
#ggsave(filename = "fake_news_type.jpg", plot = graph)