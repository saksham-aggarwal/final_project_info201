library("dplyr")
library("ggplot2")
library("stringr")

data <- data.frame(read.csv("data/fake.csv", stringsAsFactors = FALSE))

# Filtering and vectorizing the dataset for authors
authors <- select(data, author)
unique_authors <- unlist(unique(data[3]), use.names = FALSE)  #vector only

# Counts the number of news articles written by various authors
counter <- function(vector) {
  result2 <- c()
  for(i in 1:length(vector)) {
    if(vector[i] != ""){
    result2[i] <- nrow(filter(authors, author == vector[i]))
    } else {
      result2[i] <- 0
    }
  }
  result2
}

val <- counter(unique_authors)

# Extract IDs for authors
identifier <- function(vector) {
  major <- c()
  j = 1
  for(i in 1:length(vector)) {
    if(vector[i] > 50) {
      major[j] <- i
      j = j + 1
    }
  }
  major
}

ID <- identifier(val)

# Extract the authors who have written more than 50 news articles 
extract_major_author <- function(vector) {
  author <- c()
  for(i in 1:length(vector)) {
    if(unique_authors[vector[i]] != "") {
     author[i] <- str_to_title(unique_authors[vector[i]])
    } else {
      author[i] <- "unknown"
    }
  }
  author
}

major_author <- extract_major_author(ID)

# Extract the number of news articles written by authors
extract_count_for_author <- function(vector) {
  count <- c()
  for(i in 1:length(vector)) {
    count[i] <- val[vector[i]]
  }
  count
}

number_of_news <- extract_count_for_author(ID)

# Removing certain parts of the strings
major_author <- gsub("(Noreply@Blogger.com)", major_author, replacement = "")
major_author <- gsub("()", major_author, replacement = "")

# Generates the graph for the analysis
generate_graph <- function(lbls, values) {
  df <- data.frame(dataLabels = lbls, Values = values)
  
  graph <- ggplot(data = df, aes(x = dataLabels, y = Values)) + 
    geom_bar(stat = "identity", width = 0.5, fill = "darkviolet") + 
    coord_flip() + theme_bw() + xlab("Authors") + ylab("Number of articles written") + 
    geom_text(aes(label = Values), vjust=0.3, hjust = -1.0, size=3.0) + theme_minimal()
  
  return(graph)
}

# Plotting and saving the graph
plot_graph <- generate_graph(major_author, number_of_news)
##ggsave(filename = "Static Analysis 3/author_num.jpg", plot = plot_graph, width = 8, height = 8)

