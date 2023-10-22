library(ggplot2)
library(dplyr)
library(plotrix)

ac_qual <-data.frame(
  q = c("1-10","11-20","31-40","21-30","41-50",">50"),
  num = c(5,1,0,2,0,4)
)


#data <-ac_qual %>% 
#  arrange(desc(q)) %>%
#  mutate(prop = round(num / sum(ac_qual$num) *100,0)) %>%
#  mutate(ypos = round(cumsum(ac_qual$num)- 0.5*prop,0) )


# Filter out rows with num = 0
ac_qual_filtered <- ac_qual %>%
  filter(num != 0)

data <- ac_qual_filtered %>%
  arrange(desc(q)) %>%
  mutate(prop = round(num / sum(ac_qual_filtered$num) * 100, 0)) %>%
  mutate(ypos = round(cumsum(ac_qual_filtered$num) - 0.5 * prop, 0))

# Add a small constant (e.g., 0.01) to prop to avoid division by zer
#data$prop <- data$prop + 0.01


#tiff("employee_pieChat.tiff", units="in", width=10, height=10, res=300)
pie3D(data$prop, mar = rep(1.75, 4),
      col = hcl.colors(length(ac_qual_filtered$num), "Spectral"),
      labels = paste0(data$prop,"%"))
# Add a custom legend
legend(
  x =-0.8,y=0.93,
  legend = data$q,
  fill = hcl.colors(length(data$q), "Spectral"),
  title = "Employees",
  cex = 0.8,
  horiz = TRUE,
  border = NA,
  bg = "transparent",
  bty = "n"
)
#dev.off()