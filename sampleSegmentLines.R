# Load ggplot2 library
library(ggplot2)

# Sample data
data <- data.frame(Category = c("A", "B", "C"),
                   Value = c(10, 15, 12))

tiff("sampleSegmentLines.tiff", units="in", width=5, height=5, res=300)
# Create the bar plot with boundary lines and point lines on intervals
ggplot(data, aes(x = Category, y = Value)) +
  geom_col() +
  labs(title = "Bar Plot with Boundary and Point Lines",
       x = "Category",
       y = "Value") +
  theme_minimal() +
  theme(plot.background = element_rect(color = "black", size = 1)) +
  scale_x_continuous(breaks = 1:3) +
  scale_y_continuous(breaks = seq(0, 20, by = 5)) +
  geom_segment(aes(xend = as.numeric(Category), yend = 0), color = "gray", size = 0.5)
dev.off()
