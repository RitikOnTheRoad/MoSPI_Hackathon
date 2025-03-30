df <- read.csv("D:\\Users\\Documents\\MOSPI_hackathon\\Ananda\\1\\2\\data_adjusted.csv", check.names = FALSE)

dim(df)

str(df)

View(df)

df <- df[,-3]

View(df)

my_func <- function(state){
  
  temp <- df[which(df$`State/UT/All-India` == state), -1]
  
  library(tidyverse)
  
  melted_temp <- temp %>%
    pivot_longer(cols = names(temp)[-1],
                 names_to = "Family Size",
                 values_to = "Avg. MPCE")
  
  p <- melted_temp %>%
    ggplot(aes(x = `Family Size`, y = `Avg. MPCE`, fill = Sector)) +
    geom_col(position = "dodge") +
    labs(title = paste(state, ": Average MPCE in Rupees")) +
    theme(legend.position = "top")
  
  ggsave(path = "D:\\Users\\Documents\\MOSPI_hackathon\\Ananda\\1\\2\\",
         plot = p,
         width = 10,
         height = 8,
         device='png',
         dpi=1000,
         filename = paste(state, ".png", sep = ""),
         units = "in",
         bg = "white")
}

for (i in unique(df$`State/UT/All-India`)) {
  my_func(i)  
}
