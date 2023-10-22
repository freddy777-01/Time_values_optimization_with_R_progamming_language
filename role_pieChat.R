library(ggplot2)
library(dplyr)
library(plotrix)

ac_qual <-data.frame(
  q = c("manager","admins","Director","HoD","CEO","other"),
  num = c(1,2,2,2,1,4)
)

data <-ac_qual %>% 
  arrange(desc(q)) %>%
  mutate(prop = round(num / sum(ageData$num) *100,0)) %>%
  mutate(ypos = round(cumsum(num)- 0.5*prop,0) )

l <- data %>%
  mutate(csum = rev(cumsum(rev(prop))), 
         pos = prop/2 + lead(csum, 1),
         pos = if_else(is.na(pos), prop/2, pos))

#tiff("academic_qualification_pieChat.tiff", units="in", width=10, height=10, res=300)
pie3D(data$prop, mar = rep(1.75, 4),
      col = hcl.colors(length(ac_qual$num), "Spectral"),
      labels = paste0(data$prop,"%"))
# Add a custom legend
legend(
  x =-0.8,y=0.84,
  legend = ac_qual$q,
  fill = hcl.colors(length(ac_qual$num), "Spectral"),
  title = "Organization role",
  cex = 0.6,
  horiz = TRUE,
  border = NA,
  bg = "transparent",
  bty = "n"
)
#dev.off()