raw_data <- read.csv("D:\\Users\\Documents\\MOSPI_hackathon\\Ananda\\1\\2\\data_handed.csv", check.names = FALSE)

dim(raw_data)

str(raw_data)

View(raw_data)

raw_data$`9` <- as.numeric(raw_data$`9`)
raw_data$`10+` <- as.numeric(raw_data$`10+`)

str(raw_data)

for (i in seq(1, 1035, 28)) {
  for (j in ((i+1) : (i+27))) {
    raw_data[j, 1] <- raw_data[i, 1]
  }
}

dim(raw_data)

View(raw_data)

a <- which(raw_data$Fractile.class.of.MPCE == "Avg. MPCE (Rs.)")

df <- raw_data[a,]

View(df)

write.csv(df, "D:\\Users\\Documents\\MOSPI_hackathon\\Ananda\\1\\2\\data_adjusted.csv", row.names = FALSE)
