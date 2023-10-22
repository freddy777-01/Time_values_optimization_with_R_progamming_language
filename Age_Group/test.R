# Example data with renamed columns
data <- data.frame(
  response = c("NO", "YES", "NO", "NO", "NO", "YES", "NO", "YES", "YES", "NO","NO","YES"),
  age_group = c("< 30", "< 30", "30 - 39", "< 30", "< 30", "30 - 39", "< 30", "30 - 39", "40 – 49", "30 - 39","50 >","40 - 49")
)
#data$response
# Count the occurrences of "YES" and "NO" within each age group
counts <- table(data$reponse, data$response)

# Convert the counts to a data frame
count_df <- as.data.frame.matrix(counts)
age_g<-as.data.frame(row.names.data.frame(count_df))
d <- data.frame(
  age = age_g,
  no = count_df[,1],
  yes = count_df[,1]
)
# Rename the columns to match your original column names
colnames(d) <- c("age","no", "yes")

# Create a bar plot
library(ggplot2)

prop_data <- data %>%
  group_by(age_group, response) %>%
  summarise(count = n()) %>%
  mutate(prop = count / sum(count))

ggplot(prop_data, aes(x = "", y = prop, fill = response)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(
    title = "Pie Chart of YES and NO Responses by Age Group",
    fill = "Response"
  ) +
  theme_void() +
  scale_fill_manual(values = c("NO" = "red", "YES" = "green"))
