# Load ggplot2 library
library(ggplot2)

# Sample data
data <- data.frame(Category = c("A", "B", "C"),
                   Value1 = c(10, 15, 12),
                   Value2 = c(8, 11, 9))

tiff("sampleGeomBarDodge.tiff", units="in", width=10, height=10, res=300)
# Create the bar plot with position "dodge" and different names for each bar
ggplot(data, aes(x = Category)) +
  geom_bar(aes(y = Value1, fill = "Value1"), position = "dodge", stat = "identity", width = 0.4) +
  geom_bar(aes(y = Value2, fill = "Value2"), position = "dodge", stat = "identity", width = 0.4) +
  scale_fill_manual(values = c(Value1 = "blue", Value2 = "red"),
                    name = "Legend Title",
                    labels = c("Value1" = "Custom Name 1", "Value2" = "Custom Name 2")) +
  labs(title = "Bar Plot with Dodge Position",
       x = "Category",
       y = "Value") +
  theme_minimal()
dev.off()