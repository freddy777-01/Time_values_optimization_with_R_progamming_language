library(readxl)
library(ggplot2)
library(dplyr)
library(plotrix)
#library(ggrepel)
#library(tidyverse)
age_group<-as.data.frame(read_excel("Demographic_and_BI_adoption.xlsx", sheet = "Demography_information", range = "C2:C13",col_names = FALSE,col_types = "text"))

bi_doption<-as.data.frame(read_excel("Demographic_and_BI_adoption.xlsx", sheet = "Business_intelligence_adoption", range = "B2:B13",col_names = FALSE,col_types = "text"))

occurance<-table(age_group[,1],bi_doption[,1])

q<-as.data.frame.matrix(occurance)
age_row_names <-as.data.frame(row.names.data.frame(q))
nFrame<-data.frame(
  age = age_row_names,
  no = q[,1],
  yes = q[,2]
)
colnames(nFrame)<-c("age","no","yes")

# Compute the position of labels

data <- nFrame %>% 
  arrange(desc(age)) %>%
  mutate(prop = round(yes / sum(nFrame$yes) *100,0)) %>%
  mutate(ypos = round(cumsum(prop)- 0.5*prop,0))

# finding the limits for outside label
d <- data %>%
  mutate(csum = rev(cumsum(rev(prop))), 
       pos = prop/2 + lead(csum, 1),
       pos = if_else(is.na(pos), prop/2, pos))

#pie(nFrame$yes, labels = nFrame$age,angle = 180)
#tiff("age_vs_awareness_pieChat.tiff", units="in", width=5, height=5, res=300)
ggplot(data, aes(x="",y = prop,fill=age)) + 
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar(theta = "y",start = 0)+
  geom_text(aes(label = age), color = "white", size=4,position = position_stack(vjust = 0.5)) +
  scale_fill_brewer(palette="Set1") +
  scale_y_continuous(breaks = d$pos, labels = paste0(d$prop,"%"))+
  theme(
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    legend.position="none",
    panel.background = element_rect(fill = "white"))
#  geom_label_repel(data,aes(y = ypos, label = paste0(ypos, "%")),size = 4.5, nudge_x = 1, show.legend = FALSE)
#  guides(fill = guide_legend(title = "Group"))
#  geom_text(aes(x = 1.5, y = ypos, label = paste0(round(ypos, 1), "%")),size = 4, hjust = 0)
#dev.off()
