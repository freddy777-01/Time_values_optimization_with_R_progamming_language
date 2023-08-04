# Sample data
x <- 1:10
y1 <- c(2, 4, 6, 8, 10, 12, 14, 16, 18, 20)
y2 <- c(3, 5, 7, 9, 11, 13, 15, 17, 19, 21)

# Load ggplot2 library
library(ggplot2)




# Create the plot
tiff("sampleGraph.tiff", units="in", width=5, height=5, res=300)

ggplot(data = data.frame(x = x, y1 = y1, y2 = y2)) +
  geom_line(aes(x = x, y = y1, color = "Line 1", linetype = "Line 1")) +
  geom_point(aes(x = x, y = y1, color = "Line 1", shape = "Line 1")) +
  geom_line(aes(x = x, y = y2, color = "Line 2", linetype = "Line 2")) +
  geom_point(aes(x = x, y = y2, color = "Line 2", shape = "Line 2")) +
  labs(title = "Plot with Multiple Lines and Points",
       x = "X-axis", y = "Y-axis", color = "Lines", linetype = "Lines") +
  scale_color_manual(values = c("Line 1" = "blue", "Line 2" = "red"),
                     labels = c("Line 1", "Line 2")) +
  scale_linetype_manual(values = c("Line 1" = "solid", "Line 2" = "dashed")) +
  scale_shape_manual(values = c("Line 1" = 16, "Line 2" = 17)) +
  guides(color = guide_legend(override.aes = list(shape = c(16, 17)))) +
  theme_minimal()
dev.off()


