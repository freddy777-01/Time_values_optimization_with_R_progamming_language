library(readxl)
library(ggplot2)

age_group<-as.data.frame(read_excel("Demographic_and_BI_adoption.xlsx", sheet = "Demography_information", range = "D2:D13",col_names = FALSE,col_types = "text"))

bi_doption<-as.data.frame(read_excel("Demographic_and_BI_adoption.xlsx", sheet = "Business_intelligence_adoption", range = "C2:C13",col_names = FALSE,col_types = "text"))

occurance<-table(age_group[,1],bi_doption[,1])

q<-as.data.frame.matrix(occurance)
age_row_names <-as.data.frame(row.names.data.frame(q))
nFrame<-data.frame(
  qln = age_row_names,
  no = q[,1],
  yes = q[,2]
)
colnames(nFrame)<-c("qln","no","yes")

#tiff("age_vs_awareness_barChat.tiff", units="in", width=5, height=5, res=300)
ggplot(nFrame, aes(x=qln,y = yes,fill=qln)) + 
  geom_col(width = 0.5)+
  scale_y_continuous(breaks = seq(1,10,by=1))+
  coord_cartesian(ylim = c(1,10))+
  labs(
    title = "Age Category vs Awareness",
    x="Age Categories",
    y="Frequency",
    fill ="Legend"
  )+theme_minimal()
#dev.off()
