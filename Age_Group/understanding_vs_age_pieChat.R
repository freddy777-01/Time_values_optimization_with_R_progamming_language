library(readxl)
library(ggplot2)
library(dplyr)
age_group<-as.data.frame(read_excel("Demographic_and_BI_adoption.xlsx", sheet = "Demography_information", range = "C2:C13",col_names = FALSE,col_types = "text"))

bi_doption<-as.data.frame(read_excel("Demographic_and_BI_adoption.xlsx", sheet = "Business_intelligence_adoption", range = "D2:D13",col_names = FALSE,col_types = "text"))

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

tiff("understanding_vs_age_pieChat.tiff", units="in", width=5, height=5, res=300)
ggplot(data, aes(x="",y = ypos,fill=age)) + 
  geom_bar(stat="identity", width=1, color="white")+
  coord_polar("y", start=0)+
  labs(
    title = "Age Category vs Understanding",
    x="Age Categories",
    y="Frequency",
    fill ="Legend"
  )+theme_void()+
  theme(legend.position="none") +
  geom_text(aes(y = ypos, label = age), color = "white", size=4,position = position_stack(vjust = 0.5)) +
  scale_fill_brewer(palette="Set1")+
  geom_text(aes(x = 1.5, y = ypos, label = paste0(round(ypos, 1), "%")),
            size = 4, hjust = 0)
dev.off()
