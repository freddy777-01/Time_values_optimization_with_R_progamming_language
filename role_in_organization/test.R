library(ggplot2)
#library(tidyverse)

df <- data.frame(value = c(15, 0, 32, 28, 0, 0),
                 group = paste0("G", 1:6))

# Calculate the percentages
total <- sum(df$value)
df$percentage <- (df$value / total) * 100

# Create labels in percentage format
df$label <- paste0(round(df$percentage, 1), "%")
# Create a stacked bar chart
ggplot(df, aes(x = factor(1), y = percentage, fill = group)) +
  geom_bar(stat = "identity", width = 1, position = "fill") +  # Adjust heights with "fill"
  geom_text(aes(label = label), position = position_fill(vjust = 0.5), size = 3) +  # Add labels in percentage format
  guides(fill = guide_legend(title = "Group")) +
  scale_x_discrete(labels = NULL) +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +  # Format y-axis as percentage
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(),
        legend.position = "right")