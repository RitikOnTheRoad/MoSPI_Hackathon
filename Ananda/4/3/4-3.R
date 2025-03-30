df <- read.csv("D:\\Users\\Documents\\MOSPI_hackathon\\Ananda\\4\\3\\data_adjusted.csv", check.names = FALSE)

dim(df)

str(df)

df$`Regular wage/salary earning in agriculture` <- as.numeric(df$`Regular wage/salary earning in agriculture`)

str(df)

View(df)

any(is.na(df) == TRUE)

x <- which(is.na(df) == TRUE, arr.ind = TRUE); x

df[x] <- 0

for(i in 1:nrow(df)){
  
  jpeg(paste("D:\\Users\\Documents\\MOSPI_hackathon\\Ananda\\4\\3\\", df[i, 1], ".jpg", sep = ""), 
       width = 7000, height = 4000, 
       res = 500)

  values <- as.numeric(df[i, -1])
  
  percentages <- round(( values / sum(values) ) * 100, digits = 2)
  
  pie(values, 
      paste(names(df)[-1], ":", percentages, "%"),
      col = c("#FF5733", "#33FF57", "#3357FF", "#FF33A8", "#FFC733", "#33FFF5", "#A833FF"),
      main = paste("Employment Distribution in", df[i, 1]))
      
  dev.off()
}
