raw_data <- read.csv("D:\\Users\\Documents\\MOSPI_hackathon\\Ananda\\4\\3\\data_handed.csv", check.names = FALSE)

dim(raw_data)

str(raw_data)

a <- which(raw_data$`Fractile class of MPCE` == "Estd. no. of households(00)")

df <- raw_data[a,]

View(df)

df <- df[,-c(2, ncol(df))]

View(df)

write.csv(df, "D:\\Users\\Documents\\MOSPI_hackathon\\Ananda\\4\\3\\data_adjusted.csv", row.names = FALSE)
