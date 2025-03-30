data_1 <- read.csv("D:\\Users\\Documents\\MOSPI_hackathon\\Ananda\\1\\3\\data_handed.csv", check.names = FALSE)

a <- which(data_1$Fractile.class.of.MPCE == 'All classes')
a

df <- data_1[-a,]
dim(df)

b <- which(df$Fractile.class.of.MPCE == 'Avg. MPCE (Rs.)')
b

df <- df[-b,]
dim(df)

write.csv(df, "D:\\Users\\Documents\\MOSPI_hackathon\\Ananda\\1\\3\\data_adjusted.csv", row.names = FALSE)

df <- read.csv("D:\\Users\\Documents\\MOSPI_hackathon\\Ananda\\1\\3\\data_adjusted.csv", check.names = FALSE)

dim(df)

View(df)

for (i in seq(1, 887, 24)) {
  for (j in ((i+1) : (i+23))) {
    df[j, 1] <- df[i, 1]
  }
}

View(df)

write.csv(df, "D:\\Users\\Documents\\MOSPI_hackathon\\Ananda\\1\\3\\data_adjusted.csv", row.names = FALSE)
