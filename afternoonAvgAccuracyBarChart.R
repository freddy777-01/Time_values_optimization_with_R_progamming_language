library(readxl)
library(ggplot2)

afternoon_AvgOrdinal<-round(as.numeric(read_excel("Alldata_excel.xlsx", sheet = "All data", range = "R56",col_names = FALSE,col_types = "text")),2)
afternoon_AvgMNLR<-round(as.numeric(read_excel("Alldata_excel.xlsx",sheet = "All data", range = "R57",col_names = FALSE,col_types = "text")),2)
afternoon_AvgGA<-round(as.numeric(read_excel("Alldata_excel.xlsx", range = "R58",col_names = FALSE,col_types = "text")),2)


#max(midnight_load)
#geom_hline(yintercept = 0, color = "black", linetype = "solid") #draws the x-axis line

loadData<-data.frame(
  AccuracyAVG = c(afternoon_AvgOrdinal,afternoon_AvgMNLR,afternoon_AvgGA),
  xvalues =c("Avg_Ordinal","Avg_Heuristic","Avg_GA")
)
tiff("afternoonAvgAccuracyBarChart.tiff", units="in", width=5, height=5, res=300)
ggplot(loadData,aes(x=xvalues,y=AccuracyAVG,fill=xvalues))+geom_col(width = 0.5)+
  labs(
    title = "",
    x="",
    y="Overall accuracy",
    fill =""
  )+
  scale_y_continuous(breaks = seq(0,100,by=5))+
  coord_cartesian(ylim = c(5,113))+
  theme_minimal()+
  theme(legend.title = element_text(hjust = 0.5, margin = margin(t=0.3,b = 10)),
        panel.border = element_rect(color = "black", fill = NA, size = 1),
        legend.key.size = unit(0.9, "lines"),
        legend.position = c(0.64, 0.99),
        legend.direction = "horizontal"
  )+
  guides(fill=guide_legend(title.position = "top"))+
  geom_text(aes(label = AccuracyAVG), vjust = -0.5, size = 4, color = "black")
dev.off()

#legend.background = element_rect(color = "black", size = 0.2),
