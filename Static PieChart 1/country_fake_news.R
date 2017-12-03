library("dplyr")
library("ggplot2")

dataset <- read.csv("~/Desktop/CourseWork/Sophomore Year/Autumn 2017/INFO201/Final Project/final_project_info201/data/fake.csv", stringsAsFactors = FALSE)

plotChart <- function(data) {
  reqd_set <- data.frame(dataset[10])
  colnames(reqd_set) <- c("Country")
  
  #filtering the data
  us <- nrow(filter(reqd_set, Country == "US"))
  de <- nrow(filter(reqd_set, Country == "DE"))
  eu <- nrow(filter(reqd_set, Country == "EU"))
  co <- nrow(filter(reqd_set, Country == "CO"))
  fr <- nrow(filter(reqd_set, Country == "FR"))
  gb <- nrow(filter(reqd_set, Country == "GB"))
  au <- nrow(filter(reqd_set, Country == "AU"))
  ca <- nrow(filter(reqd_set, Country == "CA"))
  sg <- nrow(filter(reqd_set, Country == "SG"))
  li <- nrow(filter(reqd_set, Country == "LI"))
  io <- nrow(filter(reqd_set, Country == "IO"))
  mb <- nrow(filter(reqd_set, Country == "MB"))
  tv <- nrow(filter(reqd_set, Country == "TV"))
  es <- nrow(filter(reqd_set, Country == "ES"))
  ru <- nrow(filter(reqd_set, Country == "RU"))
  nl <- nrow(filter(reqd_set, Country == "NL"))
  me <- nrow(filter(reqd_set, Country == "ME"))
  in_ <- nrow(filter(reqd_set, Country == "IN"))
  ir <- nrow(filter(reqd_set, Country == "IR"))
  ee <- nrow(filter(reqd_set, Country == "EE"))
  se <- nrow(filter(reqd_set, Country == "SE"))
  za <- nrow(filter(reqd_set, Country == "ZA"))
  is <- nrow(filter(reqd_set, Country == "IS"))
  bg <- nrow(filter(reqd_set, Country == "BG"))
  ch <- nrow(filter(reqd_set, Country == "CH"))
  none <- nrow(filter(reqd_set, Country == ""))
  total <- nrow(reqd_set)
  
  df <- data.frame(
    legend = c("US", "Germany", "Europe Union", "Colombia", "France", "UK", "Australia", "Canada", 
              "Singapore", "Liechtenstein", "British Indian Ocean Territory", "MB", 
              "Tuvalu", "Spain", "Russian Federation", "Netherlands", "Montenegro", 
              "India", "Iran", "Estonia", "Sweden", "South Africa", "Iceland", 
              "Bulgaria", "Switzerland", "NONE"),
    slices = c(us, de, eu, co, fr, gb, au, ca, sg, li, io, mb, tv, es, ru, nl, me, in_, 
                ir, ee, se, za, is, bg, ch, none)
  )

   pie_chart <- ggplot(df, aes(x="", y=slices, fill=legend))+
      geom_bar(width = 1, stat = "identity") + coord_polar("y", start=50) + ylab("Fake News according to Countries")
  
  return(pie_chart)
}  

plot_pie <- plotChart(dataset)

ggsave(filename = "test.jpg", plot = plot_pie)
#ggsave(filename = "Fake News From Countries", plot = plot_pie)




