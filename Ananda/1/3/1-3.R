data_1 <- read.csv("D:\\Users\\Documents\\MOSPI_hackathon\\Ananda\\1\\3\\data_adjusted.csv", check.names = FALSE)

dim(data_1)

names(data_1)

str(data_1)

data_1$`9` <- as.numeric(data_1$`9`)
data_1$`10+` <- as.numeric(data_1$`10+`)

str(data_1)

View(data_1)

any(is.na(data_1) == TRUE)

col_na <- c()

col_na <- apply(data_1, 2, FUN = is.na)

table(col_na[,1])
table(col_na[,2])
table(col_na[,3])
table(col_na[,4])
table(col_na[,5])
table(col_na[,6])
table(col_na[,7])
table(col_na[,8])
table(col_na[,9])
table(col_na[,10])
table(col_na[,11])
table(col_na[,12])

unique(data_1[which(col_na[, 12] == TRUE), 1])

table(col_na[,13])

unique(data_1[which(col_na[, 13] == TRUE), 1])

na_states <- c("Chandigarh", "Puducherry", "Goa")

states <- unique(data_1$`State/UT/All-India`)


my_func_1 <- function(state){
  
  df_1 <- data_1[which(data_1$`State/UT/All-India` == state),]
  
  df_11 <- df_1[which(df_1$Sector == "Rural"), -(1:2)]
  df_12 <- df_1[which(df_1$Sector == "Urban"), -(1:2)]
  
  library(tidyverse)
  
  df_melted_11 <- df_11 %>%
    pivot_longer(cols = names(df_11)[-1],
                 names_to = "size",
                 values_to = "percentage")
  
  p1 <- df_melted_11 %>%
    ggplot(aes(x = Fractile.class.of.MPCE, y = percentage, fill = size)) +
    geom_col(position = "stack") +
    labs(x = "Fracticle Class of MPCE", y = "", 
         title = paste(state, ": Rural"), fill = "Family Size") +
    theme(axis.text.x = element_text(angle = 45),
          axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          legend.position = "top") +
    guides(fill = guide_legend(nrow = 1))
  
  df_melted_12 <- df_12 %>%
    pivot_longer(cols = names(df_12)[-1],
                 names_to = "size",
                 values_to = "percentage")
  
  p2 <- df_melted_12 %>%
    ggplot(aes(x = Fractile.class.of.MPCE, y = percentage, fill = size)) +
    geom_col(position = "stack") +
    labs(x = "Fracticle Class of MPCE", y = "", 
         title = paste(state, ": Urban"), fill = "Family Size") +
    theme(axis.text.x = element_text(angle = 45),
          axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          legend.position = "top") +
    guides(fill = guide_legend(nrow = 1))
  
  library(gridExtra)
  
  plot <- grid.arrange(p1, p2, nrow = 1, ncol = 2)
  
  ggsave(path = "D:\\Users\\Documents\\MOSPI_hackathon\\Ananda\\1\\3\\",
         plot = plot,
         width = 16,
         height = 8,
         device='png',
         dpi=1000,
         filename = paste(state, ".png", sep = ""),
         units = "in",
         bg = "white")
}

for (i in states) {
  my_func_1(i)
}





