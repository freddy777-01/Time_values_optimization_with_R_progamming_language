# Sample data
data <- data.frame(
  category = rep(c("A", "B", "C", "D"), each = 4),
  interval = rep(c("0-5", "5-10", "10-15", "15-20"), times = 4),
  count = c(10, 20, 15, 5, 8, 12, 5, 3, 15, 10, 6, 3)
)

# Load ggplot2 library
library(ggplot2)

# Create the plot
tiff("sampleAreaChart.tiff", units="in", width=5, height=5, res=300)
ggplot(data, aes(x = interval, y = count, fill = category)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(title = "Stacked Histogram with Independent Intervals",
       x = "Interval", y = "Count", fill = "Category") +
  theme_minimal() +
  scale_x_discrete(labels = c("0-5" = "0 to 5",
                              "5-10" = "5 to 10",
                              "10-15" = "10 to 15",
                              "15-20" = "15 to 20"))
dev.off()


