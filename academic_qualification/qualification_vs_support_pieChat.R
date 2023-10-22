library(readxl)
library(ggplot2)
library(dplyr)
#library(plotrix)
aca_qln<-as.data.frame(read_excel("Demographic_and_BI_adoption.xlsx", sheet = "Demography_information", range = "D2:D13",col_names = FALSE,col_types = "text"))

bi_doption<-as.data.frame(read_excel("Demographic_and_BI_adoption.xlsx", sheet = "Business_intelligence_adoption", range = "E2:E13",col_names = FALSE,col_types = "text"))

occurance<-table(aca_qln[,1],bi_doption[,1])

q<-as.data.frame.matrix(occurance)
aca_row_names <-as.data.frame(row.names.data.frame(q))
nFrame<-data.frame(
  qln = aca_row_names,
  no = q[,1],
  yes = q[,2]
)
colnames(nFrame)<-c("qln","no","yes")

# Compute the position of labels

data <- nFrame %>% 
  arrange(desc(qln)) %>%
  mutate(prop = round(yes / sum(nFrame$yes) *100,0)) %>%
  mutate(ypos = round(cumsum(prop)- 0.5*prop,0) )

l <- data %>%
  mutate(csum = rev(cumsum(rev(prop))), 
         pos = prop/2 + lead(csum, 1),
         pos = if_else(is.na(pos), prop/2, pos))
#tiff("age_vs_awareness_pieChat.tiff", units="in", width=5, height=5, res=300)

ggplot(data, aes(x="",y = prop,fill=qln)) + 
  geom_bar(stat="identity", width=1, color="white")+
  coord_polar(theta = "y", start=0)+
  geom_text(aes(label = qln), color = "white", size=4,position = position_stack(vjust = 0.5)) +
  scale_fill_brewer(palette="Set1") +
  scale_y_continuous(breaks = l$ypos, labels = paste0(data$prop,"%"))+
  theme(
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    legend.position="none",
    panel.background = element_rect(fill = "white"))
#  geom_text(aes(x = 1.5, y = ypos, label = paste0(round(ypos, 1), "%")),size = 4, hjust = 0)

#d <-c(10,20,30,40,70)
#pie3D(d, mar = rep(1.75, 4),
#      col = hcl.colors(length(d), "Spectral"),
#      labels = d,
#      explode = 0.2)
#dev.off()
