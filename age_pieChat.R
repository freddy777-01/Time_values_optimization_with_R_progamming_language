library(ggplot2)
library(dplyr)
library(plotrix)

ageData <-data.frame(
  age = c("< 30","30 - 39","40 - 49","> 50"),
  num = c(5,4,2,1)
)

data <-ageData %>% 
  arrange(desc(age)) %>%
  mutate(prop = round(num / sum(ageData$num) *100,0)) %>%
  mutate(ypos = round(cumsum(num)- 0.5*prop,0) )

l <- data %>%
  mutate(csum = rev(cumsum(rev(prop))), 
         pos = prop/2 + lead(csum, 1),
         pos = if_else(is.na(pos), prop/2, pos))

#tiff("age_pieChat.tiff", units="in", width=10, height=10, res=300)
pie3D(data$prop, mar = rep(1.75, 4),
      col = hcl.colors(length(ageData$num), "Spectral"),
      labels = paste0(data$prop,"%"))
# Add a custom legend
legend(
  x =0.5,y=0.93,
  legend = ageData$age,
  fill = hcl.colors(length(ageData$num), "Spectral"),
  title = "Age Groups",
  cex = 0.9,
  horiz = FALSE,
  border = NA,
  bg = "transparent",
  bty = "n"
)
#dev.off()