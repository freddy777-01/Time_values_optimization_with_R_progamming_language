library(readxl)
library(ggplot2)

night_AvgOrdinal<-round(as.numeric(read_excel("Alldata_excel.xlsx", sheet = "All data", range = "R72",col_names = FALSE,col_types = "text")),2)
night_AvgMNLR<-round(as.numeric(read_excel("Alldata_excel.xlsx",sheet = "All data", range = "R73",col_names = FALSE,col_types = "text")),2)
night_AvgGA<-round(as.numeric(read_excel("Alldata_excel.xlsx", range = "R74",col_names = FALSE,col_types = "text")),2)


#geom_hline(yintercept = 0, color = "black", linetype = "solid") #draws the x-axis line

loadData<-data.frame(
  AccuracyAVG = c(night_AvgOrdinal,night_AvgMNLR,night_AvgGA),
  xvalues =c("Avg_Ordinal","Avg_Heuristic","Avg_GA")
)
tiff("nightAvgAccuracyBarChart.tiff", units="in", width=5, height=5, res=300)
ggplot(loadData,aes(x=xvalues,y=AccuracyAVG,fill=xvalues))+geom_col(width = 0.5)+
  labs(
    title = "",
    x="",
    y="Overall accuracy",
    fill =""
  )+
  scale_y_continuous(breaks = seq(0,100,by=5))+
  coord_cartesian(ylim = c(5,100))+
  theme_minimal()+
  theme(legend.title = element_text(hjust = 0.5, margin = margin(b = 10)),
        panel.border = element_rect(color = "black", fill = NA, size = 1),
        legend.key.size = unit(0.9, "lines"),
        legend.position = c(0.80, 0.96),
  )+
  geom_text(aes(label = AccuracyAVG), vjust = -0.5, size = 4, color = "black")
dev.off()

#  geom_text(aes(label = AccuracyAVG), vjust = -0.5, size = 4, color = "black")+
#legend.background = element_rect(color = "black", size = 0.2),